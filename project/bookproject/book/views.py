from django.shortcuts import render
from django.views.generic import ListView
from .models import Book

class ListBookView(ListView):
    template_name = 'bookproject/book/book_list.html'
    model = Book