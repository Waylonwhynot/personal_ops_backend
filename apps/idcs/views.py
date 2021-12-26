from django.shortcuts import render

# Create your views here.
from django_filters import OrderingFilter
from rest_framework import status
from rest_framework.filters import SearchFilter
from rest_framework.permissions import IsAuthenticated

from rest_framework.views import APIView
from rest_framework.response import Response
from django.http import Http404

from utils.pagination import BasicPagination
from utils.views import CommonModelViewSet
from .models import IDC
from .serializers import IdcSerializer
from rest_framework.viewsets import ModelViewSet

# class IdcList(APIView):
#     def get(self, request):
#         Idc_queryset = IDC.objects.all()
#         Idc_ser = IdcSerializer(instance=Idc_queryset, many=True)
#         return Response(Idc_ser.data)
#
#     def post(self, request):
#         Idc_ser = IdcSerializer(data=request.data)
#         if Idc_ser.is_valid():
#             Idc_ser.save()
#             return Response(Idc_ser.data, status=status.HTTP_201_CREATED)
#         return Response(Idc_ser.data, status=status.HTTP_400_BAD_REQUEST)
#
#
# class IdcDetail(APIView):
#     def get(self, request, pk):
#         try:
#             Idc_obj = IDC.objects.filter(pk=pk).first()
#             Idc_ser = IdcSerializer(instance=Idc_obj)
#             return Response(Idc_ser.data)
#         except IDC.DoesNotExist:
#             raise Response(status=status.HTTP_404_NOT_FOUND)
#
#     def put(self, request, pk):
#         Idc_obj = IDC.objects.filter(pk=pk).first()
#         Idc_ser = IdcSerializer(instance=Idc_obj, data=request.data)
#         if Idc_ser.is_valid():
#             Idc_ser.save()
#             return Response(data=Idc_ser.data, status=status.HTTP_200_OK)
#         else:
#             return Response(Idc_ser.errors, status=status.HTTP_400_BAD_REQUEST)
#
#     def delete(self, request, pk):
#         Idc_obj = IDC.objects.filter(pk=pk).first()
#         Idc_obj.delete()
#         return Response(status=status.HTTP_204_NO_CONTENT)


class IdcModelViewSet(CommonModelViewSet):
    """
    retrieve:
        返回指定IDC信息
    list:
        返回IDC列表
    update:
        更新IDC信息
    destroy:
        删除IDC记录
    create:
        创建IDC记录
    partial_update:
        更新部分字段
    """
    queryset = IDC.objects.all().order_by('id')
    serializer_class = IdcSerializer
    pagination_class = BasicPagination
    permission_classes = [IsAuthenticated,]
