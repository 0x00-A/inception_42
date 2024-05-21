FROM debian:bookworm-slim

# update and install utils
RUN apt update
RUN apt install -y nginx openssl vim curl

# setting the user
#RUN addgroup nginx
#RUN adduser -S -G nginx nginx
#USER nginx

WORKDIR /etc/nginx

# ssl
# RUN mkdir ssl
# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
# 	 -keyout ./ssl/nginx-selfsigned.key -out \
# 	 ./ssl/nginx-selfsigned.crt -subj "/C=/ST=/L=/O=/OU=/CN="


EXPOSE 443

# RUN rm http.d/default.conf
COPY ./conf/nginx.conf .

# RUN chown nginx /srv/www/wordpress

CMD ["nginx", "-g", "daemon off;"]

