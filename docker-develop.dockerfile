FROM python:3.8

ENV PYTHONBUFFERED 1

RUN mkdir /var/log/uwsgi/
RUN touch /var/log/uwsgi/project.log

RUN mkdir -p /app/src
RUN mkdir -p /app/logs
RUN chown -R www-data:www-data /app

RUN pip install pipenv

COPY Pipfile app/Pipfile
COPY Pipfile.lock app/Pipfile.lock
RUN cd /app && pipenv install --dev --system --deploy --ignore-pipfile


WORKDIR /app/src


