from django.shortcuts import render

# Create your views here.
from rest_framework.viewsets import ModelViewSet

from .models import Cabinet
from cabinet.serializer import CabinetSerializer


class CabinetModelViewSet(ModelViewSet):
    """
    retrieve:
        返回指定机柜信息
    list:
        返回机柜列表
    update:
        更新机柜信息
    destroy:
        删除机柜记录
    create:
        创建机柜C记录
    partial_update:
        更新部分字段
    """
    queryset = Cabinet.objects.all()
    serializer_class = CabinetSerializer