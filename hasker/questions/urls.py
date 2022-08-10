from django.urls import path

from questions.views import QuestionCreateView, QuestionDetailView, VoteView, MarkRight, QuestionListView, \
    QuestionSearchView

urlpatterns = [
    path("ask/", QuestionCreateView.as_view(), name="ask"),
    path("detail/<int:pk>/", QuestionDetailView.as_view(), name="detail"),
    path("vote/", VoteView.as_view(), name="vote"),
    path("mark-right/", MarkRight.as_view(), name="mark-right"),
    path("index/", QuestionListView.as_view(), name="index"),
    path("search/", QuestionSearchView.as_view(), name="search"),
]
