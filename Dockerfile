FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y \
    unzip \
    python3 \
    python3-pip \
    wget

COPY entrypoint.sh /

WORKDIR /opt

RUN wget https://github.com/github/codeql-cli-binaries/releases/download/v2.12.3/codeql-linux64.zip && \
unzip codeql-linux64.zip

ENTRYPOINT ["/entrypoint.sh"]
