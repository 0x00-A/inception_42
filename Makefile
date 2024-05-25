
PROJECT_NAME=app

#--project-name

all: up

clean:
	docker-compose --project-directory ./srcs down

fclean: 
	docker-compose --project-directory ./srcs down --rmi all -v

up:
	docker-compose --project-directory ./srcs --env-file ./srcs/.env up

down:
	docker-compose --project-directory ./srcs down

re: fclean all
