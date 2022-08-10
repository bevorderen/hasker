from django import forms
from django.core.exceptions import ValidationError

from questions.models import Question, Tag, Answer


class TagsField(forms.Field):
    widget = forms.TextInput()

    def to_python(self, value):
        tags = []
        if value:
            values = [tag.lower() for tag in map(str.strip, value.split(",")) if tag]
            if len(values) <= 3:
                for tag_name in values:
                    tags.append((Tag.objects.get_or_create(name=tag_name)[0]))
                return tags
            else:
                raise ValidationError("Only 3 tags allowed")

        return tags


class QuestionAddForm(forms.ModelForm):
    tags = TagsField(required=False)

    class Meta:
        model = Question
        fields = ("title", "text", "tags")


class AnswerCreateForm(forms.ModelForm):
    class Meta:
        model = Answer
        fields = ("text",)
