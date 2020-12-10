FROM python:3.8

ENV PYTHONBUFFERED 1


RUN mkdir /var/log/uwsgi/
RUN touch /var/log/uwsgi/project.log

COPY ./requirements.txt /requirements.txt

RUN pip install -r /requirements.txt
RUN mkdir -p /app/src
RUN mkdir -p /app/logs
RUN chown -R www-data:www-data /app


WORKDIR /app/src


