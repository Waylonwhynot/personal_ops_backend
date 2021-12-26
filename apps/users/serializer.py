from rest_framework import serializers

class UserSerializer(serializers.Serializer):
    """
    用户序列化类
    """
    id = serializers.IntegerField(read_only=True)
    username = serializers.CharField()
    email = serializers.EmailField()