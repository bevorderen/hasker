from django.contrib.auth.models import AbstractUser
from django.db import models
from django.urls import reverse
from django.utils.crypto import get_random_string
from django.utils.translation import gettext_lazy as _


def upload_avatar_name(user, filename: str) -> str:
    return f'avatars/{str(user.pk)}-{get_random_string(length=8)}/{filename}'


class User(AbstractUser):
    email = models.EmailField(
        _("email address"),
        unique=True,
        error_messages={
            "unique": _("A user with that email already exists."),
        },
    )
    avatar = models.ImageField(
        verbose_name="Аватарка",
        upload_to=upload_avatar_name,
        blank=True,
        null=True,
        default="avatars/default/avatar.png",
    )

    def get_absolute_url(self) -> str:
        return reverse("users:settings")

    @property
    def url(self) -> str:
        return self.get_absolute_url()
