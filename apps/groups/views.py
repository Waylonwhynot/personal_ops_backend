from django.shortcuts import render

# Create your views here.

from rest_framework import viewsets
from django.contrib.auth.models import Group
from rest_framework.filters import SearchFilter

from utils.pagination import BasicPagination
from utils.views import CommonModelViewSet
from .serializers import GroupSerializer
from .filter import GroupFilter

class GroupsViewSet(CommonModelViewSet):
    queryset = Group.objects.all()
    serializer_class = GroupSerializer
    pagination_class = BasicPagination
    filter_backends = [SearchFilter]
    search_fields = ['name']