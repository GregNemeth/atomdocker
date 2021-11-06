FROM ubuntu:21.04
COPY ./atom-amd64.deb .
RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y mesa-utils \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y ./atom-amd64.deb \
    && rm -f ./atom-amd64.deb && useradd -d /home/atom -s /bin/bash
USER atom
ENV XDG_CONFIG_HOME=/home/atom/.config
CMD ["atom","-f","--no-sandbox"]
