from django.db import models

# Create your models here.

class IDC(models.Model):
    name = models.CharField("机房名称", max_length=64)
    address = models.CharField("机房地址", max_length=256)
    phone = models.CharField("机房联系电话", max_length=15)
    email = models.EmailField("机房email", default="null")
    letter = models.CharField("IDC机房简称",max_length=5)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'resources_idc'