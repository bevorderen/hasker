SHELL=/bin/bash
prod:
	psql --username postgres -c "CREATE ROLE otus_user WITH PASSWORD '111111' LOGIN;"
	createdb --username postgres --owner otus_user otus
	sudo apt install python3-pip python3-setuptools python3.8-venv --noinput
	python3 -m venv env
	source env/bin/active
	pip3 install - requirements.txt
	psql --username postgres otus < db_dump/otus.sql
	python3 manage.py makemigrations
	python3 manage.py migrate
	python3 manage.py collectstatic --noinput
	python3 manage.py runserver

