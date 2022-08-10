from django.contrib.auth import authenticate, login
from django.contrib.auth.views import LoginView, LogoutView
from django.shortcuts import get_object_or_404
from django.urls import reverse_lazy
from django.views.generic import UpdateView, FormView

from users.forms import SignUpForm
from users.models import User


class HaskerLoginView(LoginView):
    next_page = "questions:index"
    template_name = "user/login.html"
    redirect_authenticated_user = True


class HaskerLogoutView(LogoutView):
    next_page = reverse_lazy("users:login")


class HaskerSignupView(FormView):
    form_class = SignUpForm
    template_name = "user/signup.html"
    success_url = reverse_lazy("questions:index")

    def form_valid(self, form):
        form.save()
        username = form.cleaned_data.get("username")
        password = form.cleaned_data.get("password1")
        user = authenticate(username=username, password=password)
        login(self.request, user)
        return super().form_valid(form=form)


class HaskerSettingsView(UpdateView):
    model = User
    fields = ("email", "avatar")
    template_name = "user/settings.html"

    def get_object(self, queryset=None) -> User:
        return get_object_or_404(User, pk=self.request.user.pk)
