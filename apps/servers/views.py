from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets
from rest_framework.filters import SearchFilter

from utils.pagination import BasicPagination
from utils.views import CommonReadOnlyModelViewSet
from .models import Server, NetworkDevice, IP
from .serializers import IPSerializer, NetworkDeviceSerializer, ServerAutoReportSerializer, ServerSerializer
from rest_framework import mixins


class ServerAutoReportViewSet(mixins.CreateModelMixin, viewsets.GenericViewSet):
    """
    create:
        创建服务器记录
    """
    queryset = Server.objects.all()
    serializer_class = ServerAutoReportSerializer


class ServerViewSet(CommonReadOnlyModelViewSet):
    queryset = Server.objects.all()
    serializer_class = ServerSerializer
    pagination_class = BasicPagination
    filter_backends = [SearchFilter]
    search_fields = ['hostname']


class NetworkDeviceViewSet(viewsets.ReadOnlyModelViewSet):
    """
    list:
        返回网卡信息列表
    retrieve：
        返回一个网卡信息
    """
    queryset = NetworkDevice.objects.all()
    serializer_class = NetworkDeviceSerializer


class IPViewSet(viewsets.ReadOnlyModelViewSet):
    """
    list:
        返回IP信息列表
    retrieve：
        返回一个IP信息
    """
    queryset = IP.objects.all()
    serializer_class = IPSerializer
