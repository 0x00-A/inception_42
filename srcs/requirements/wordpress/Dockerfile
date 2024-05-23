FROM debian:bookworm-slim

ENV PHP_VERSION 8.2

RUN apt update
RUN apt install -y curl php${PHP_VERSION}-fpm php${PHP_VERSION}-mysql mariadb-client

# download wordpress
RUN mkdir -p /srv/www
RUN chown -R www-data: /srv/www
WORKDIR /srv/www
RUN curl https://wordpress.org/latest.tar.gz | tar zx


# wp cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/wordpress-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/wordpress-entrypoint.sh

ENTRYPOINT [ "wordpress-entrypoint.sh" ]

CMD [ "php-fpm8.2", "-F" ]
