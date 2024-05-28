FROM debian:bullseye

ENV PHP_VERSION 7.4

RUN apt update \
&& apt install -y curl php${PHP_VERSION}-fpm php${PHP_VERSION}-mysql mariadb-client

# download wordpress
WORKDIR /srv/www
RUN chown -R www-data: /srv/www \
&& curl -sS https://wordpress.org/latest.tar.gz | tar zx


# wp cli
RUN curl -sS -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& chmod +x wp-cli.phar \
&& mv wp-cli.phar /usr/local/bin/wp

# 
RUN mkdir -p /run/php/ \
&& chown -R www-data: /run/php


COPY ./tools/wordpress-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/wordpress-entrypoint.sh

RUN sed -i '/^listen = /s/.*/listen = 0.0.0.0:9000/' /etc/php/$PHP_VERSION/fpm/pool.d/www.conf

ENTRYPOINT [ "wordpress-entrypoint.sh" ]

CMD php-fpm$PHP_VERSION -F
