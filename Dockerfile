FROM debian:buster

# Dependencies upgrade
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update -y && \
    apt-get dist-upgrade -y

# Installs ansible requirements
RUN apt-get install -y --no-install-recommends \
    openssh-client \
    gnupg2 \
    sshpass \
    python-setuptools \
    python-crypto \
    python-yaml \
    python-jinja2 \
    python-paramiko \
    python-httplib2 \
    python-six \
    git

# Installs Ansible
RUN echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' > /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
    apt-get update && \
    apt-get install -y ansible

CMD ["ansible", "--version"]