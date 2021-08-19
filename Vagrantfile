# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"

    config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "4096", "--cpus", "2"]
    end

    # View the documentation for the provider you are using for more
    # information on available options.
    config.vm.provision "shell", inline: <<-SHELL
      apt update
      apt install -y openjdk-8-jre-headless jq make
    SHELL

    config.vm.provision "shell", inline: <<-SHELL
        apt remove -y docker docker-engine docker.io containerd runc
        apt update
        apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
        add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
        apt update
        apt install -yqq docker-ce docker-ce-cli containerd.io

        curl -fsSL "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        chmod +x /usr/local/bin/docker-compose

        usermod -a -G docker vagrant

        # avoid issues with subnet already used by internal networks
        echo '{"bip": "192.168.43.1/24"}' >> /etc/docker/daemon.json
        systemctl restart docker
      SHELL
  end
