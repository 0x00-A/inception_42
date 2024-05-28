FROM debian:bullseye

RUN apt update \
&& apt install -y mariadb-server

COPY ./tools/mariadb-entrypoint.sh /usr/local/bin

RUN chmod +x /usr/local/bin/mariadb-entrypoint.sh \
&& mkdir /run/mysqld \
&& chown mysql: /run/mysqld

ENTRYPOINT [ "mariadb-entrypoint.sh" ]

CMD [ "mariadbd", "-umysql", "--bind-address=0.0.0.0" ]
