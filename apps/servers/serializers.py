from rest_framework import serializers
from .models import Server, NetworkDevice, IP
from manufacturer.models import Manufacturer, ProductModel


class ServerAutoReportSerializer(serializers.Serializer):
    """
    服务器同步序列化类
    """
    ip = serializers.IPAddressField(required=True)
    hostname = serializers.CharField(required=True, max_length=20)
    cpu = serializers.CharField(required=True, max_length=50)
    mem = serializers.CharField(required=True, max_length=20)
    disk = serializers.CharField(required=True, max_length=200)
    os = serializers.CharField(required=True, max_length=50)
    sn = serializers.CharField(required=True, max_length=50)
    manufacturer = serializers.CharField(required=True)
    model_name = serializers.CharField(required=True)
    uuid = serializers.CharField(required=True, max_length=50)
    network = serializers.JSONField(required=True)

    def validate_manufacturer(self, value):
        try:
            return Manufacturer.objects.get(vendor_name__exact=value)
        except Manufacturer.DoesNotExist:
            return self.create_manufacturer(value)

    def validate(self, attrs):
        manufacturer_obj = attrs["manufacturer"]
        try:
            attrs["model_name"] = manufacturer_obj.productmodel_set.get(model_name__exact=attrs["model_name"])
        except ProductModel.DoesNotExist:
            attrs["model_name"] = self.create_product_model(manufacturer_obj, attrs["model_name"])
        return attrs

    def create_server(self, validated_data):
        network = validated_data.pop("network")
        server_obj = Server.objects.create(**validated_data)
        self.check_server_network_device(server_obj, network)
        return server_obj

    def create(self, validated_data):
        uuid = validated_data["uuid"].lower()
        sn = validated_data["sn"].lower()
        try:
            if sn == uuid or sn == "" or sn.startwith("vmware"):
                # 虚拟机
                server_obj = Server.objects.get(uuid__icontains=uuid)
            else:
                # 物理机
                server_obj = Server.objects.get(uuid__icontains=sn)
        except Server.DoesNotExist:
            return self.create_server(validated_data)
        else:
            return self.update_server(server_obj, validated_data)

    def update_server(self, instance, validate_data):
        instance.hostname = validate_data.get("hostname", instance.hostname)
        instance.cpu = validate_data.get("hostname", instance.cpu)
        instance.ip = validate_data.get("hostname", instance.ip)
        instance.mem = validate_data.get("hostname", instance.mem)
        instance.disk = validate_data.get("hostname", instance.disk)
        instance.os = validate_data.get("hostname", instance.os)
        self.check_server_network_device(instance, validate_data["network"])
        instance.save()
        return instance

    def check_server_network_device(self, server_obj, network):
        """
        检查指定服务器有没有这些网卡设备，并作关联
        """
        network_device_queryset = server_obj.networkdevice_set.all()
        current_network_device_queryset = []
        for device in network:
            try:
                network_device_obj = network_device_queryset.get(name__exact=device["name"])
            except NetworkDevice.DoesNotExist:
                # 网卡不存在
                network_device_obj = self.create_network_device(server_obj, device)
            self.check_ip(network_device_obj, device["ips"])
            current_network_device_queryset.append(network_device_obj)

        for network_device_obj in set(network_device_queryset) - set(current_network_device_queryset):
            network_device_obj.delete()

    def check_ip(self, network_device_obj, ifnets):
        ip_queryset = network_device_obj.ip_set.all()
        current_ip_queryset = []
        for ifnet in ifnets:
            try:
                ip_queryset.get(ip_addr__exact=ifnet["ip_addr"])
            except IP.DoesNotExist:
                ip_obj = self.create_ip(network_device_obj, ifnet)
            current_ip_queryset.append(ip_obj)

        for ip_obj in set(ip_queryset) - set(current_ip_queryset):
            ip_obj.delete()

    def create_ip(self, network_device_obj, ifnet):
        ifnet["device"] = network_device_obj
        return IP.objects.create(**ifnet)

    def create_network_device(self, server_obj, device):
        ips = device.pop("ips")
        device["host"] = server_obj
        network_device_obj = NetworkDevice.objects.create(**device)
        device["ips"] = ips
        return network_device_obj

    def create_manufacturer(self, vendor_name):
        return Manufacturer.objects.create(vendor_name=vendor_name)

    def create_product_model(self, manufacturer_obj, model_name):
        return ProductModel.objects.create(model_name=model_name, vendor=manufacturer_obj)

    def to_representation(self, instance):
        ret = {
            "hostname": instance.hostname,
            "ip": instance.ip
        }
        return ret


class ServerSerializer(serializers.ModelSerializer):
    """
    服务器序列化类
    """

    def get_network_device(self, server_obj):
        ret = []
        network_device = server_obj.networkdevice_set.all()
        for device in network_device:
            data = {
                "name": device.name,
                "mac": device.mac_address,
                "ips": self.get_ip(device)
            }
            ret.append(data)
        return ret

    def get_ip(self, device_obj):
        ret = []
        for ifnet in device_obj.ip_set.all():
            data = {
                "ip": ifnet.ip_addr,
                "netmask": ifnet.netmask
            }
            ret.append(data)
        return ret

    def to_representation(self, instance):
        ret = super(ServerSerializer, self).to_representation(instance)
        ret["device"] = self.get_network_device(instance)
        return ret

    class Meta:
        model = Server
        fields = "__all__"


class NetworkDeviceSerializer(serializers.ModelSerializer):
    class Meta:
        model = NetworkDevice
        fields = "__all__"


class IPSerializer(serializers.ModelSerializer):
    class Meta:
        model = IP
        fields = "__all__"
