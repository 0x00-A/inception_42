FROM debian:bookworm

RUN apt update

RUN apt install -y curl php8.2-fpm php8.2-mysql mariadb-client

# download wordpress
RUN mkdir -p /srv/www
RUN chown -R www-data: /srv/www
WORKDIR /srv/www
RUN curl https://wordpress.org/latest.tar.gz | tar zx
RUN chown -R www-data: /srv/www/wordpress

# wp cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
# RUN mkdir -p /srv/www
# RUN chown -R www-data: /srv/www
# RUN wp core download --path=/srv/www/wordpress --force --allow-root
# RUN chown -R www-data: /srv/www/wordpress
# RUN chown -R www-data: /srv/www/wordpress/*

# RUN wp plugin install --allow-root redis-cache --activate --path=/srv/www/wordpress

# RUN wp package install wp-cli/restful --allow-root

COPY ./tools/wordpress-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/wordpress-entrypoint.sh

ENTRYPOINT [ "wordpress-entrypoint.sh" ]

CMD [ "php-fpm8.2", "-F" ]
