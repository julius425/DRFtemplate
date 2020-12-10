from .base import *

DEBUG = True
EMAIL_BACKEND = 'django.core.mail.backends.locmem.EmailBackend'
ALLOWED_HOSTS = [
    '127.0.0.1',
    '0.0.0.0',
]

try:
    from .local import *
except ImportError:
    pass

