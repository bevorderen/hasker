from django.conf import settings
from django.contrib.auth import get_user_model
from django.db import models, transaction
from django.urls import reverse

from users.models import User


class Tag(models.Model):
    name = models.CharField(max_length=100, primary_key=True)

    def __str__(self):
        return self.name


class AbstractQA(models.Model):
    text = models.TextField(max_length=5000)
    created = models.DateTimeField("Дата публикации", auto_now_add=True)
    updated = models.DateTimeField("Дата изменения", auto_now=True)
    author = models.ForeignKey(get_user_model(), on_delete=models.CASCADE)
    likers = models.ManyToManyField(get_user_model())
    dislikers = models.ManyToManyField(get_user_model())

    class Meta:
        abstract = True
        ordering = ['-created']

    @property
    def votes(self):
        return self.likers.count() - self.dislikers.count()

    @transaction.atomic
    def vote(self, user: User, like: bool = True):
        if like:
            self.dislikers.remove(user)
            if self.likers.filter(pk=user.pk).exists():
                self.likers.remove(user)
            else:
                self.likers.add(user)
        else:
            self.likers.remove(user)
            if self.dislikers.filter(pk=user.pk).exists():
                self.dislikers.remove(user)
            else:
                self.dislikers.add(user)


class Question(AbstractQA):
    class Meta:
        ordering = ['-created']

    title = models.TextField(max_length=255)
    tags = models.ManyToManyField(Tag, blank=True, related_name="questions")
    likers = models.ManyToManyField(get_user_model(), related_name="q_users_like")
    dislikers = models.ManyToManyField(get_user_model(), related_name="q_user_dislike")
    right_answer = models.OneToOneField(
        "Answer",
        blank=True,
        null=True,
        on_delete=models.CASCADE,
        related_name="win_question"
    )

    def get_absolute_url(self):
        return reverse("questions:detail", kwargs={"pk": self.pk})

    @property
    def url(self):
        return self.get_absolute_url()


class Answer(AbstractQA):
    question = models.ForeignKey(Question, related_name="answers", on_delete=models.CASCADE)
    likers = models.ManyToManyField(get_user_model(), related_name="a_users_like")
    dislikers = models.ManyToManyField(get_user_model(), related_name="a_user_dislike")
