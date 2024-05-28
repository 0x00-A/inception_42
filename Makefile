all: up

clean:
	docker compose -f ./srcs/docker-compose.yml down

fclean:
	docker compose -f ./srcs/docker-compose.yml down --rmi all -v

up:
	@mkdir -p /home/${USER}/data/portainer
	@mkdir -p /home/${USER}/data/wordpress
	@mkdir -p /home/${USER}/data/mariadb
	@mkdir -p /home/${USER}/data/adminer
	docker compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up -d --build

down:
	docker compose -f ./srcs/docker-compose.yml down

re: fclean all
