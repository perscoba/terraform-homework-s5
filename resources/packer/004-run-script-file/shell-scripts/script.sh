







#!/bin/bash

# Update package lists
sudo apt-get update

# Install Docker Engine
sudo apt-get install -y docker.io

# Install JDK and JRE
sudo apt-get install -y openjdk-11-jdk openjdk-11-jre

# Install Node.js and npm
sudo apt-get install -y nodejs npm

# Install Maven
sudo apt-get install -y maven

# Install htop
sudo apt-get install -y htop

# Install watch
sudo apt-get install -y watch

# Install build-essential
sudo apt-get install -y build-essential

echo "Installation complete!"


    sudo apt update -y
    sudo apt-get install -y curl 
    sudo apt-get install -y wget 
    sudo apt-get install -y vim 
    sudo apt-get install -y git 
    sudo apt-get install -y make 
    sudo apt-get install -y ansible 
    sudo apt-get install -y python3-pip 
    sudo apt-get install -y pip3
    sudo apt-get install -y openssl 
    sudo apt-get install -y rsync 
    sudo apt-get install -y jq 
    sudo apt-get install -y postgresql-client 
    sudo apt-get install -y mariadb-client 
    sudo apt-get install -y mysql-client 
    sudo apt-get install -y unzip 
    sudo apt-get install -y tree
    sudo apt-get install -y  apt-utils
    sudo  apt-get install -y kubelet='1.29.x-*' kubectl='1.29.x-*' 



     ## Install AWS CLI
    # https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    aws --version

    ## Install Packer
    # https://developer.hashicorp.com/packer/downloads
    sudo wget https://releases.hashicorp.com/packer/1.7.4/packer_1.7.4_linux_amd64.zip -P /tmp
    sudo unzip /tmp/packer_1.7.4_linux_amd64.zip -d /usr/local/bin
    chmod +x /usr/local/bin/packer
    packer --version

    ## Install Docker
    # https://docs.docker.com/engine/install/ubuntu/
    sudo apt-get remove docker docker-engine docker.io containerd runc -y
    sudo apt-get update
    sudo apt-get install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    sudo apt-get update
    sudo apt install docker-ce docker-ce-cli containerd.io -y
    sudo systemctl start docker
    sudo systemctl enable docker

    ## Install Docker Coompose
    # https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    docker-compose --version

    ## Install Java 11
    # https://stackoverflow.com/questions/52504825/how-to-install-jdk-11-under-ubuntu
    sudo apt-get update
    sudo apt-get install openjdk-11-jdk -y 
    java --version
    sudo update-java-alternatives --list
    # sudo update-alternatives --config java

    ## Install Terraform
    # https://releases.hashicorp.com/terraform/
    TERRAFORM_VERSION="1.2.6"
    sudo wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
    sudo unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
    sudo mv terraform /usr/local/bin/terraform
    sudo rm -f terraform terraform_${TERRAFORM_VERSION}_linux_amd64.zip
    terraform --version

   
   

    ## Install kubectl
    sudo curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.17.9/2020-08-04/bin/linux/amd64/kubectl 
    sudo chmod +x ./kubectl 
    sudo mv kubectl /usr/local/bin/
        
    ## INSTALL KUBECTX AND KUBENS
    sudo wget https://raw.githubusercontent.com/ahmetb/kubectx/master/kubectx 
    sudo wget https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens 
    sudo chmod +x kubectx kubens 
    sudo mv kubens kubectx /usr/local/bin

    ## Install Helm 3
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
    sudo  chmod 700 get_helm.sh
    sudo ./get_helm.sh
    sudo helm version

    