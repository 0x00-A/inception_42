# Use the Debian image from Docker Hub
FROM debian:stable

# Update the package list
RUN apt update

# Install MariaDB server
RUN apt install -y mariadb-server
# RUN apt -y install systemctl


# Expose the MariaDB port
EXPOSE 3306

# Start MariaDB service
#CMD ["service", "mysql", "start"]

COPY mariadb-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/mariadb-entrypoint.sh


# RUN mkdir -p /var/lib/mysql/
# RUN chown mysql /var/lib/mysql/

RUN mkdir /run/mysqld
RUN chown mysql /run/mysqld

# USER mysql

ENTRYPOINT [ "mariadb-entrypoint.sh" ]

# USER mysql

CMD [ "mariadbd", "-umysql", "--bind-address=0.0.0.0" ]