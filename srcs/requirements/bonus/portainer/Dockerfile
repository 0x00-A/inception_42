FROM debian:bullseye

ENV PORTAINER_VERSION=2.13.1

RUN apt update && apt install -y curl tar ca-certificates

RUN curl -LsS https://github.com/portainer/portainer/releases/download/${PORTAINER_VERSION}/portainer-${PORTAINER_VERSION}-linux-amd64.tar.gz | tar -xz

EXPOSE 9000 9443

ENTRYPOINT ["/portainer/portainer", "-H", "unix:///var/run/docker.sock"]

