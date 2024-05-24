FROM debian:bookworm-slim

ENV PORTAINER_VERSION=2.13.1

#ca-certificates
RUN apt update
RUN apt install -y curl tar

RUN mkdir -p /portainer
# RUN chown -R portainer: /portainer
RUN chmod -R 777 /portainer


RUN curl -L https://github.com/portainer/portainer/releases/download/${PORTAINER_VERSION}/portainer-${PORTAINER_VERSION}-linux-amd64.tar.gz | tar -xz -C /portainer


EXPOSE 9000

RUN chmod -R 777 /portainer

ENTRYPOINT ["/portainer/portainer/portainer"]

