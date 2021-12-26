from rest_framework.routers import DefaultRouter
from .views import GroupsViewSet

group_router = DefaultRouter()
group_router.register('groups', GroupsViewSet, basename="Groups")