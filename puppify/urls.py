from django.urls import path

from . import views

app_name = 'puppify'
urlpatterns = [
    path('', views.index, name='index'),
]