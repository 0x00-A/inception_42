FROM debian:bookworm-slim

RUN apt update
RUN apt -y install redis-server php8.2-redis

# COPY ./tools/redis-entrypoint.sh /usr/local/bin
# RUN chmod +x /usr/local/bin/redis-entrypoint.sh

# ENTRYPOINT [ "redis-entrypoint.sh" ]

CMD [ "redis-server", "--protected-mode no" ]
