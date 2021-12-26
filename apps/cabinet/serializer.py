from rest_framework import serializers
from idcs.serializers import IdcSerializer
from idcs.models import IDC
from .models import Cabinet


class CabinetSerializer(serializers.Serializer):
    # idc = serializers.PrimaryKeyRelatedField(many=False, queryset=IDC.objects.all())
    idc = serializers.SerializerMethodField()
    name = serializers.CharField(required=True)

    # def to_representation(self, instance):
    #     idc_obj = instance.idc
    #     ret = super(CabinetSerializer, self).to_representation(instance)
    #     ret["idc"] = {
    #         "id": idc_obj.id,
    #         "name": idc_obj.name
    #     }
    #     return ret

    def get_idc(self, obj):
        print(obj)
        print(obj.idc)
        return {
            "id": obj.idc.id,
            "name": obj.idc.name
        }

    def to_internal_value(self, data):
        """
        反序列化第一步: 拿到提交过来的原始数据：QueryDict ==> request.GET request.POST
        """
        print(data)
        return super(CabinetSerializer, self).to_internal_value(data)

    def create(self, validated_data):
        raise serializers.ValidationError("create error")
        return Cabinet.objects.create(**validated_data)
