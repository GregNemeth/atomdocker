FROM ubuntu:21.04
ENV ATOM_VERSION v1.58.0
RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y mesa-utils curl gcc bzip2 \
    && curl -L https://github.com/atom/atom/releases/download/${ATOM_VERSION}/atom-amd64.deb > /tmp/atom.deb \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y /tmp/atom.deb \
    && rm -f /tmp/atom.deb && apt-get clean && \
    mkdir /go && \
    useradd -m greg -d /home/greg/ && chown greg:greg /go
RUN mkdir /tmp/go && mkdir /usr/local/go && \
    curl -L https://golang.org/dl/go1.17.3.linux-amd64.tar.gz -o /tmp/go/go1.17.3.linux-amd64.tar.gz  && \
    cd /tmp/go && tar -C /usr/local -xzf go1.17.3.linux-amd64.tar.gz && \
    rm -f /tmp/go/go1.17.3.linux-amd64.tar.gz
USER greg 
ENV XDG_CONFIG_HOME=/home/greg/.config
ENV GOPATH=/go
ENV PATH=/go/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
CMD ["/usr/bin/atom","-f","--no-sandbox"]
