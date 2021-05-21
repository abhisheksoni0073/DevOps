#### Installation instructions

__Python 3.7+__

    update-alternatives --install /usr/bin/python python /usr/bin/python3.8 2

__Sasl__

    apt install libsasl2-dev

__Pip__

    apt-get install python3-pip
    update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 2

__Virtualenv__

    pip install virtualenv

__OpenJDK__

    apt-get install openjdk-11-jdk

__Node__

    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    apt-get install -y nodejs

__Maven__

    wget https://mirrors.estointernet.in/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip -O /opt/apache-maven-3.6.3-bin.zip
    unzip /opt/apache-maven-3.6.3-bin.zip -d /opt/

__Gradle__

    wget https://services.gradle.org/distributions/gradle-6.7-bin.zip -O /opt/gradle-6.7-bin.zip
    unzip /opt/gradle-6.7-bin.zip -d /opt/

__Terraform__

    curl -L -o /opt/terraform/terraform.zip https://releases.hashicorp.com/terraform/0.13.4/terraform_0.13.4_linux_amd64.zip
    (cd /opt/terraform && unzip -q /opt/terraform/terraform.zip && rm /opt/terraform/terraform.zip)

__Adding Environment variable__

    echo "PATH=$PATH:/opt/apache-maven-3.6.3/bin:/opt/gradle-6.7/bin:/opt/terraform" >> ~/.bashrc && source ~/.bashrc

__Docker__

    curl -sSLk https://get.docker.com | bash -

__Docker-Compose__

    sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose