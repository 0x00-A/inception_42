
MARIADB_VOLUME=db_volume
WORDPRESS_VOLUME=wp_volume
DOCKER_NETWORK=default
APP_NAME=app
NGINX_IMAGE=nginx
WORDPRESS_IMAGE=wordpress
MARIADB_IMAGE=mariadb
REDIS_IMAGE=redis

all: up

#--project-name
up:
	docker-compose --project-directory ./srcs up

down:
	docker-compose --project-directory ./srcs down

rmi:
clean:
	docker rmi $(APP_NAME)-$(NGINX_IMAGE) || true
	docker rmi $(APP_NAME)-$(WORDPRESS_IMAGE) || true
	docker rmi $(APP_NAME)-$(MARIADB_IMAGE) || true
	docker rmi $(APP_NAME)-$(REDIS_IMAGE) || true

	docker volume rm $(APP_NAME)_$(MARIADB_VOLUME) || true
	docker volume rm $(APP_NAME)_$(WORDPRESS_VOLUME) || true