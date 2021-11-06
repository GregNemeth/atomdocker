FROM ubuntu:21.04
COPY ./atom-amd64.deb .
RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y mesa-utils \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y ./atom-amd64.deb \
    && rm -f ./atom-amd64.deb && apt-get clean && \
    useradd -d /home/greg -m greg -s /bin/bash
USER greg 
ENV XDG_CONFIG_HOME=/home/greg/.config
CMD ["atom","-f","--no-sandbox"]
