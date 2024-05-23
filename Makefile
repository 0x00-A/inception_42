
MARIADB_VOLUME=db_volume
WORDPRESS_VOLUME=wp_volume
ADMINER_VOLUME=adminer_volume
PORTAINER_VOLUME=portainer_data

DOCKER_NETWORK=default

APP_NAME=app

NGINX_IMAGE=nginx
WORDPRESS_IMAGE=wordpress
MARIADB_IMAGE=mariadb
REDIS_IMAGE=redis
FTP_IMAGE=ftp
STATIC_WEBSITE_IMAGE=static_website
ADMINER_IMAGE=adminer
EXTRA_SERVICE_IMAGE=portainer

all: up

#--project-name
up:
	docker-compose --project-directory ./srcs --env-file ./srcs/.env up

down:
	docker-compose --project-directory ./srcs down

rmi:
clean:
	docker rmi $(APP_NAME)-$(NGINX_IMAGE) || true
	docker rmi $(APP_NAME)-$(WORDPRESS_IMAGE) || true
	docker rmi $(APP_NAME)-$(MARIADB_IMAGE) || true
	docker rmi $(APP_NAME)-$(REDIS_IMAGE) || true
	docker rmi $(APP_NAME)-$(FTP_IMAGE) || true
	docker rmi $(APP_NAME)-$(STATIC_WEBSITE_IMAGE) || true
	docker rmi $(APP_NAME)-$(ADMINER_IMAGE) || true
	docker rmi $(APP_NAME)-$(EXTRA_SERVICE_IMAGE) || true

	docker volume rm $(APP_NAME)_$(MARIADB_VOLUME) || true
	docker volume rm $(APP_NAME)_$(WORDPRESS_VOLUME) || true
	docker volume rm $(APP_NAME)_$(ADMINER_VOLUME) || true
	docker volume rm $(APP_NAME)_$(PORTAINER_VOLUME) || true