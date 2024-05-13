
MARIADB_VOLUME=db_volume
WORDPRESS_VOLUME=wp_volume
DOCKER_NETWORK=default
APP_NAME=myapp
NGINX_IMAGE=nginx
WORDPRESS_IMAGE=wordpress
MARIADB_IMAGE=mariadb

all: up

up:
	docker-compose up -d

down:
	docker-compose down

rmi:
	docker rmi $(APP_NAME)-$(NGINX_IMAGE) || true
	docker rmi $(APP_NAME)-$(WORDPRESS_IMAGE) || true
	docker rmi $(APP_NAME)-$(MARIADB_IMAGE) || true
clean:
	docker volume rm $(APP_NAME)_$(MARIADB_VOLUME) || true
	docker volume rm $(APP_NAME)_$(WORDPRESS_VOLUME) || true