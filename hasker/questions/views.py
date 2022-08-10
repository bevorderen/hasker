from django.conf import settings
from django.contrib.auth.mixins import LoginRequiredMixin
from django.core.exceptions import ObjectDoesNotExist
from django.core.paginator import Paginator
from django.db.models import Count, F, Q
from django.http import HttpResponseBadRequest, HttpResponse
from django.shortcuts import get_object_or_404, render, redirect
from django.urls import reverse_lazy
from django.views import View
from django.views.generic import CreateView, ListView

from questions.forms import QuestionAddForm, AnswerCreateForm
from questions.models import Question, Answer
from questions.utils import notify_author


class QuestionListView(ListView):
    paginate_by = settings.PAGINATE_QUESTIONS
    model = Question
    template_name = "question/index.html"
    queryset = Question.objects.select_related("author").prefetch_related("tags").annotate(
        likes=Count("likers"),
        dislikes=Count("dislikers"),
    )

    def get_ordering(self):
        order_by = self.request.GET.get("order_by")
        if order_by == "rank":
            ordering = (F("dislikes") - F("likes"), "-created")
        else:
            ordering = ("-created",)
        return ordering


class QuestionSearchView(ListView):
    paginate_by = settings.PAGINATE_QUESTIONS
    model = Question
    template_name = "question/index.html"
    queryset = Question.objects.select_related("author").prefetch_related("tags").annotate(
        likes=Count("likers"),
        dislikes=Count("dislikers"),
    )
    ordering = ('-created',)

    def get_queryset(self):
        queryset = self.queryset

        name = self.request.GET.get("t")
        if name:
            queryset = queryset.filter(tags__name=name)
        search_str = self.request.GET.get("s")

        if search_str:
            if "tag" in search_str:
                name = search_str[4:].strip()

                if name:
                    queryset = queryset.filter(tags__name=name)
            else:
                queryset = queryset.filter(
                    Q(title__contains=search_str) | Q(text__contains=search_str)
                )
        return queryset.order_by(
            F("dislikes") - F("likes"), "-created"
        )


class QuestionCreateView(LoginRequiredMixin, CreateView):
    form_class = QuestionAddForm
    template_name = "question/create.html"

    def form_valid(self, form):
        form.instance.author = self.request.user
        return super().form_valid(form=form)


class QuestionDetailView(LoginRequiredMixin, View):
    form_class = AnswerCreateForm
    template_name = "question/detail.html"

    def get_question(self, pk: int):
        return get_object_or_404(Question.objects.select_related("author").prefetch_related("tags"), pk=pk)

    def paginate_answers(self, request, question: Question):
        page = request.GET.get("page")
        answer_list = Answer.objects.filter(question=question).select_related("author").annotate(
            likes=Count("likers"),
            dislikes=Count("dislikers"),
        ).order_by(
            F("dislikes") - F("likes"), "-created"
        )

        paginator = Paginator(answer_list, settings.PAGINATE_ANSWERS)
        return paginator.get_page(page)

    def get(self, request, pk: int):
        question = self.get_question(pk=pk)

        context = dict()
        context["question"] = question
        context["page_obj"] = self.paginate_answers(request=request, question=question)
        context["form"] = self.form_class()

        return render(request=request, template_name=self.template_name, context=context)

    def post(self, request, pk: int):
        question = self.get_question(pk=pk)

        form = self.form_class(request.POST)
        if form.is_valid():
            answer = form.save(commit=False)
            answer.question = question
            answer.author = request.user
            answer.save()
            notify_author(request=self.request, answer=answer, question=question)
            return redirect(reverse_lazy("questions:detail", kwargs={"pk": pk}))

        context = dict()
        context["question"] = question
        context["page_obj"] = self.paginate_answers(request=request, question=question)
        context["form"] = self.form_class()

        return render(request=request, template_name=self.template_name, context=context)


class VoteView(LoginRequiredMixin, View):
    def post(self, request):
        vote_type = request.POST.get("vote_type")
        pk = int(request.POST.get("pk"))
        action_type = request.POST.get("action_type")

        try:
            if vote_type == "a":
                obj = Answer.objects.get(pk=pk)
            elif vote_type == "q":
                obj = Question.objects.get(pk=pk)
            else:
                return HttpResponseBadRequest("Wrong vote_type")

            obj.vote(user=request.user, like=action_type == "like")
        except ObjectDoesNotExist:
            return HttpResponseBadRequest(f"{pk=} object does not exist")

        return HttpResponse(obj.votes)


class MarkRight(LoginRequiredMixin, View):
    def post(self, request):
        answer_pk = int(request.POST.get("answer_pk"))
        question_pk = int(request.POST.get("question_pk"))
        try:
            answer = Answer.objects.get(pk=answer_pk)
            question = Question.objects.get(pk=question_pk)
        except ObjectDoesNotExist:
            return HttpResponseBadRequest(f"{answer_pk=}|{question_pk=} object does not exist")

        if question.author.pk != request.user.pk:
            return HttpResponseBadRequest(f"Don't have permission for this action")

        if request.POST.get("current_state") == "right" and question.right_answer and question.right_answer == answer:
            question.right_answer = None
            question.save()
            return HttpResponse(True)

        question.right_answer = answer
        question.save()
        return HttpResponse(True)
