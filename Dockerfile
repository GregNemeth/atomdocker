FROM ubuntu:21.04
COPY ./atom-amd64.deb .
ENV XDG_CONFIG_HOME=~/.config
RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y mesa-utils \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y ./atom-amd64.deb
CMD ["atom","-f","--no-sandbox"]
