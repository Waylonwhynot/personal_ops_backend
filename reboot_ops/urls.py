"""reboot_ops URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include, re_path
from rest_framework.routers import DefaultRouter
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView, TokenVerifyView

from idcs.views import IdcModelViewSet
from users.views import UserViewSet
from cabinet.views import CabinetModelViewSet
from manufacturer.views import ManufacuturerlViewSet, ProductViewSet
from servers.views import IPViewSet, ServerAutoReportViewSet, NetworkDeviceViewSet, ServerViewSet
from rest_framework.documentation import include_docs_urls



route = DefaultRouter()
route.register('users', UserViewSet, basename='user')
route.register('idcs', IdcModelViewSet, basename='idcs')
route.register('cabinet', CabinetModelViewSet, basename='cabinet')
route.register('manufacturer', ManufacuturerlViewSet, basename='manufacturer')
route.register('product', ProductViewSet, basename='product')
route.register('ip', IPViewSet, basename='ip')
route.register('serverautoreport', ServerAutoReportViewSet, basename='serverautoreport')
route.register('servers', ServerViewSet, basename='servers')
route.register('networkdevice', NetworkDeviceViewSet, basename='networkdevice')
from apps.groups.router import group_router

route.registry.extend(group_router.registry)


urlpatterns = [
    path('admin/', admin.site.urls),
    # path('', include('idcs.urls')),
    # path('', include('users.urls'))
    re_path('^', include(route.urls)),
    # re_path('^api-auth/', include("rest_framework.urls")),
    # path('docs/', include_docs_urls(title="运维平台接口文档")),
# rest_framework_simplejwt自带的得到token
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    # 刷新JWT
    path('api/v1/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    # 验证token
    path('api/token/verify/', TokenVerifyView.as_view(), name='token_verify'),
]
