from python:2.7
workdir /ribbit
copy . /ribbit
run pip install -r requeriments.txt
run python manage.py syncdb --noinput
run python manage.py migrate ribbit_app
<<<<<<< HEAD
run python manage.py runserver
=======

cmd python manage.py runserver 0.0.0.0:$PORT
>>>>>>> f54df45c56f27bf371a1895b67d3ce9916b36596
