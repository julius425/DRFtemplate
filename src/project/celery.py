import os

from celery import Celery
from celery.schedules import crontab


os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'settings.development')

app = Celery('project')
app.config_from_object('django.conf:settings', namespace='CELERY')

app.autodiscover_tasks()

app.conf.beat_schedule = {
    # test celery tasks
    'hello': {
        'task': 'core.tasks.hello',
        'schedule': crontab(minute='*/1')
    },
}
