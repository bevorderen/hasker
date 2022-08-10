from django import template
from django.conf import settings
from django.db.models import Count, F

from questions.models import Question

register = template.Library()


@register.simple_tag
def top_questions():
    return Question.objects.all().annotate(
        likes=Count("likers"),
        dislikes=Count("dislikers"),
    ).order_by(
        F("dislikes") - F("likes"), "-created"
    )[:settings.PAGINATE_QUESTIONS]
