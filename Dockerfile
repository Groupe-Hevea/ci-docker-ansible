FROM debian:11

LABEL org.opencontainers.image.source https://github.com/Groupe-Hevea/ci-docker-ansible

# Dependencies upgrade
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update -y && \
    apt-get dist-upgrade -y

# Installs ansible requirements
RUN apt-get install -y --no-install-recommends \
    python3 \
    python3-distutils \
    python3-jmespath \
    ca-certificates \
    openssh-client \
    gnupg2 \
    sshpass \
    git \
    curl \
    unzip \
    bzip2

ARG ANSIBLE_VERSION

# Install ansible
RUN curl -sSL https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py && \
    chmod +x /tmp/get-pip.py && \
    $(which python3) /tmp/get-pip.py && \
    pip install -I ansible==${ANSIBLE_VERSION}.*

CMD ["ansible", "--version"]
