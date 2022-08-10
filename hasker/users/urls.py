from django.urls import path

from users.views import HaskerLoginView, HaskerSignupView, HaskerLogoutView, HaskerSettingsView

urlpatterns = [
    path("login/", HaskerLoginView.as_view(), name="login"),
    path("logout/", HaskerLogoutView.as_view(), name="logout"),
    path("signup/", HaskerSignupView.as_view(), name="signup"),

    path("settings/", HaskerSettingsView.as_view(), name="settings"),
]
