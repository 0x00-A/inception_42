FROM debian:bullseye

RUN apt update
RUN apt install -y nginx openssl

WORKDIR /etc/nginx

# ssl
RUN mkdir ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	 -keyout ./ssl/nginx-selfsigned.key -out \
	 ./ssl/nginx-selfsigned.crt -subj "/CN=$DOMAIN_NAME"


EXPOSE 443

COPY ./conf/nginx.conf .

CMD ["nginx", "-g", "daemon off;"]

