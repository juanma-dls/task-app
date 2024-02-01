# Makefile para el proyecto task_app

# Variables
IMAGE_PREFIX=task_app
DOCKER_COMPOSE=docker-compose

# Objetivos

up: # Levanta los contenedores
	$(DOCKER_COMPOSE) up -d

down: # Detiene los contenedores
	$(DOCKER_COMPOSE) down

build: # Construye las imágenes de los contenedores
	$(DOCKER_COMPOSE) build

build-no-cache: # Construye las imágenes de los contenedores sin utilizar el caché
	$(DOCKER_COMPOSE) build --no-cache

logs: # Muestra los registros de los contenedores
	$(DOCKER_COMPOSE) logs

migrate-seed: # Ejecuta los seeders en la base de datos
	$(DOCKER_COMPOSE) exec app rails db:migrate db:seed

migrate: # Realiza las migraciones de la base de datos
	$(DOCKER_COMPOSE) exec app rails db:migrate

seed: # Ejecuta los seeders en la base de datos
	$(DOCKER_COMPOSE) exec app rails db:seed

test: # Ejecuta las pruebas
	$(DOCKER_COMPOSE) exec app rails test

.PHONY: up down build logs migrate test