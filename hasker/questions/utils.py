from django.conf import settings
from django.core.mail import send_mail


def notify_author(request, answer, question):
    subject = f"На ваш вопрос {question.title} ответили"

    message = f"""
        <p>Пользователь {answer.author.username} ответил на ваш вопрос, 
        ответ доступен <a href='{request.build_absolute_uri(question.url)}'>здесь</a></p>
    """

    recipient_list = [answer.author.email]

    send_mail(subject=subject, message=message, recipient_list=recipient_list, from_email=settings.DEFAULT_FROM_EMAIL)
