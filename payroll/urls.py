from django.urls import path
from . import views
from .views import GeneratePdf


urlpatterns = [
    path('', views.home, name="home"),
    path('search', views.search, name="search"),
    path('pdf', views.GeneratePdf.as_view(), name='pdf')
]
