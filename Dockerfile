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
    python-six

# Installs Ansible
RUN echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' > /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
    apt-get update && \
    apt-get install -y ansible

# Default user
ENV ANSIBLE_USER ansible-runner

RUN groupadd --gid 1000 $ANSIBLE_USER && useradd --uid 1000 --gid $ANSIBLE_USER --create-home --shell /bin/sh $ANSIBLE_USER

USER $ANSIBLE_USER

WORKDIR /home/$ANSIBLE_USER

RUN mkdir /home/$ANSIBLE_USER/.ssh

CMD ["ansible", "--version"]