from python:2.7
workdir /ribbit
copy . /ribbit
run pip install -r requeriments.txt
run python manage.py syncdb --noinput
run python manage.py migrate ribbit_app
run python manage.py runserver
