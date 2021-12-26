from django.shortcuts import render

# Create your views here.
from rest_framework import status

from rest_framework.views import APIView
from rest_framework.response import Response
from django.http import Http404
from .models import Manufacturer, ProductModel
from .serializers import ManufacuturerSerializer, ProductSerializer
from rest_framework.viewsets import ModelViewSet


class ManufacuturerlViewSet(ModelViewSet):
    """
    retrieve:
        返回指定制造商信息
    list:
        返回制造商列表
    update:
        更新制造商信息
    destroy:
        删除制造商记录
    create:
        创建制造商记录
    partial_update:
        更新部分字段
    """
    queryset = Manufacturer.objects.all()
    serializer_class = ManufacuturerSerializer


class ProductViewSet(ModelViewSet):
    """
    retrieve:
        返回指定产品信息
    list:
        返回产品列表
    update:
        更新产品信息
    destroy:
        删除产品记录
    create:
        创建产品记录
    partial_update:
        更新部分字段
    """
    queryset = ProductModel.objects.all()
    serializer_class = ProductSerializer