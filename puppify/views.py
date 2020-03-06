from django.http import HttpResponse
from django.shortcuts import render
from django.template import loader
from django.views import generic


def index(request):
     texte = "Hello world !"
     context = { 'texte':texte,}
     return render(request, 'puppify/index.html', context)

