FROM ubuntu:latest
LABEL "owner"="bmarzolf@globusmedical.com"

ARG GO_VERSION="1.19.4"

# Create the repo directory
RUN mkdir /repo && mkdir repo/src

# # Create directory structure for sync server application
RUN mkdir /app \
    && cd /app \
    && mkdir bin \
    && mkdir data \
    && mkdir data/config

# Expose the port for VS Code
EXPOSE 4570

ENV GM_HOME=/app \
    GM_DATA=/app/data \
    PATH="/root/.cargo/bin:${PATH}" \
    GOPATH=/root \
    PATH="/usr/local/go/bin:$GOPATH/bin:$PATH"

# Update the repositories and install the basics
RUN apt-get update && apt -y dist-upgrade \
    && apt-get install -y apt-utils \
    && apt-get install -y \
    build-essential \
    curl \
    git \
    libssl-dev \
    libffi-dev \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    vim \
    wget \
    zsh \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN echo 'alias python=python3' >> /root/.zshrc

# Install OH MY ZSH
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
RUN sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="bira"/g' /root/.zshrc


# Install Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

# Install Go
RUN cd /tmp \
    && wget https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz \
    && tar xvf go${GO_VERSION}.linux-amd64.tar.gz \
    && rm -f go${GO_VERSION}.linux-amd64.tar.gz \
    && rm -rf /usr/local/go \
    && mv go /usr/local \
    && mkdir -p /root/bin \
    && mkdir -p /root/pkg \
    && mkdir -p /root/src 

# This entrypoint keeps the container running, otherwise it will exit immediately
ENTRYPOINT [ "tail", "-f", "/dev/null" ]