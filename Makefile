PORT=8000
WEB_DOCKER_SERVICE=web

# Database
DB_DOCKER_SERVICE=db
DB_USER=root
DB_NAME=fit_attendance

# Superuser
SUPERUSER_NAME=joe
SUPERUSER_EMAIL=joe@example.com
SUPERUSER_PASSWORD=1234

venv:
	@echo "Activating venv..."
	@source .venv/bin/activate

build:
	@echo "Building..."
	@docker-compose build

up:
	@echo "Running server on ${PORT}..."
	@docker-compose up

down:
	@echo "Canceling server..."
	@docker-compose down

shell:
	@docker-compose exec ${WEB_DOCKER_SERVICE} bash

db-shell:
	@docker-compose exec ${DB_DOCKER_SERVICE} psql -U ${DB_USER} -d ${DB_NAME}

create-superuser:
	@docker-compose exec ${WEB_DOCKER_SERVICE} python manage.py createsuperuser --username=${SUPERUSER_NAME} --email=${SUPERUSER_EMAIL}
