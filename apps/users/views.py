from django.shortcuts import render
from django_filters import OrderingFilter
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import viewsets
from rest_framework.filters import SearchFilter

from utils.filters import UserFilter
from .serializer import UserSerializer
from utils.pagination import BasicPagination
# Create your views here.
from django.contrib.auth import get_user_model
User = get_user_model()

class UserViewSet(viewsets.ReadOnlyModelViewSet):
    """
    retrieve:
        返回指定用户信息
    list:
        返回用户列表
    """
    queryset = User.objects.all().order_by('id')
    serializer_class = UserSerializer
    pagination_class = BasicPagination
    filter_backends = [SearchFilter]
    search_fields = ['username', 'email']