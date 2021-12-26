from rest_framework import serializers
from rest_framework.generics import ListAPIView
from rest_framework.viewsets import ModelViewSet, ReadOnlyModelViewSet
from utils.response import APIResponse
from rest_framework.response import Response



class CommonModelViewSet(ModelViewSet):
    def create(self, request, *args, **kwargs):
        res = super(CommonModelViewSet, self).create(request, *args, **kwargs)
        return APIResponse(data=res.data)

    def retrieve(self, request, *args, **kwargs):
        res = super(CommonModelViewSet, self).retrieve(request, *args, **kwargs)
        return APIResponse(data=res.data)

    def update(self, request, *args, **kwargs):
        print('patch-data', request.data)
        res = super(CommonModelViewSet, self).update(request, *args, **kwargs)
        return APIResponse(data=res.data)

    def destroy(self, request, *args, **kwargs):
        res = super(CommonModelViewSet, self).destroy(request, *args, **kwargs)
        return APIResponse()

    def list(self, request, *args, **kwargs):
        res = super(CommonModelViewSet, self).list(request, *args, **kwargs)
        return APIResponse(data=res.data)


class CommonReadOnlyModelViewSet(ReadOnlyModelViewSet):

    def retrieve(self, request, *args, **kwargs):
        res = super(CommonReadOnlyModelViewSet, self).retrieve(request, *args, **kwargs)
        return APIResponse(data=res.data)

    def list(self, request, *args, **kwargs):
        res = super(CommonReadOnlyModelViewSet, self).list(request, *args, **kwargs)
        return APIResponse(data=res.data)