from django.shortcuts import render
from rest_framework import viewsets

from apps.api.models import User
from apps.api.serializers import UserSerializer


class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

