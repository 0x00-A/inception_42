FROM debian:stable

RUN apt update

RUN apt install -y vim curl php8.2-fpm php-mysql

CMD [ "php-fpm8.2", "-F" ]
