from django.db import models

# Create your models here.

from django.contrib.auth.models import AbstractUser

class User(AbstractUser):
    name = models.CharField("姓名", max_length=32, null=True, help_text="姓名")
    phone = models.CharField("电话", max_length=11, null=True, help_text="手机号")
    id_rsa_key = models.TextField(null=True)
    id_rsa_pub = models.TextField(null=True)


    class Meta:
        verbose_name = "用户"
        ordering = ['id']
        db_table = 'auth_user'

    def __str__(self):
        return self.username
