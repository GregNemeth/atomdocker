FROM ubuntu:21.04
ENV ATOM_VERSION v1.58.0
RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y mesa-utils curl \
    && curl -L https://github.com/atom/atom/releases/download/${ATOM_VERSION}/atom-amd64.deb > /tmp/atom.deb \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y /tmp/atom.deb \
    && rm -f /tmp/atom.deb && apt-get clean && \
    useradd -d /home/greg -m greg -s /bin/bash
USER greg 
ENV XDG_CONFIG_HOME=/home/greg/.config
CMD ["atom","-f","--no-sandbox"]
