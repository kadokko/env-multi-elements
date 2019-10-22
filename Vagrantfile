Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"
  config.vm.hostname = "multi-elements"

  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.synced_folder ".", "/vagrant_share", :owner => "vagrant", :group => "vagrant", :mount_options => ['dmode=755', 'fmode=755']
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.name = "multi-elements"
  end

  config.vm.provision "shell", inline: <<-SHELL

    # install docker

    apt-get update -y

    apt-get install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      gnupg-agent \
      software-properties-common

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    apt-key add -

    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) \
      stable"

    apt-get update -y
    apt-get install -y \
      docker-ce \
      docker-ce-cli \
      containerd.io

    usermod -aG docker vagrant

    # install docker compose

    curl -s \
         -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" \
         -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
   
    docker-compose --version

    # clean
    
    apt-get clean

  SHELL

end
