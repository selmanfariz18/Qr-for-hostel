from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.

class User(AbstractUser):
    name=models.CharField(max_length=20)
    password=models.CharField(max_length=20)
    phn=models.IntegerField()

    pass
