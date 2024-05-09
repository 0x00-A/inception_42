# Use the Debian image from Docker Hub
FROM debian:latest

# Update the package list
RUN apt-get update

# Install MariaDB server
RUN apt-get install -y mariadb-server

# Expose the MariaDB port
EXPOSE 3306

# Start MariaDB service
#CMD ["service", "mysql", "start"]

CMD ["mysqld"]


