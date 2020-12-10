from project.celery import app


@app.task
def hello(*args, **kwargs):
    print(f'\"one minute later...\" {args=} {kwargs=}')