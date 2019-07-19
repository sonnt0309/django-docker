from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils import timezone
from django.utils.translation import ugettext_lazy as _


# Create your models here.
class User(AbstractUser):
    created_date = models.DateTimeField(default=timezone.now, verbose_name=_('created date'))
    updated_date = models.DateTimeField(default=timezone.now, verbose_name=_('updated date'))
    is_deleted = models.BooleanField(default=False, verbose_name=_('is deleted'))
