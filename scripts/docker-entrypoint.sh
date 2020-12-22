#!/bin/bash

# scriptfile used to make `predocker` actions

echo "Collect static files"
python manage.py collectstatic --noinput


echo "Apply database migrations"
python manage.py migrate


echo "Starting server"
uwsgi --ini /etc/uwsgi/emperor.ini