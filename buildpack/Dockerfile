FROM ubuntu:24.04

USER root

# update packages
RUN apt-get update
RUN apt-get upgrade -y

# install certs curl unzip and software common
RUN apt-get install ca-certificates curl unzip software-properties-common -y

# install chromium + driver
RUN add-apt-repository ppa:xtradeb/apps -y
RUN apt-get update
RUN apt-get install chromium chromium-driver -y

# install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# install helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh
RUN rm get_helm.sh

# install java
RUN apt-get install openjdk-21-jdk -y

# install maven
RUN curl -fsSL https://dlcdn.apache.org/maven/maven-3/3.9.8/binaries/apache-maven-3.9.8-bin.tar.gz -o apache-maven-3.9.8-bin.tar.gz
RUN tar -xvf apache-maven-3.9.8-bin.tar.gz
RUN mv apache-maven-3.9.8 /opt/
RUN rm apache-maven-3.9.8-bin.tar.gz

ENV M2_HOME="/opt/apache-maven-3.9.8"
ENV PATH="$M2_HOME/bin:$PATH"

# install node
RUN curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh
RUN sh nodesource_setup.sh
RUN apt-get install -y nodejs
RUN rm nodesource_setup.sh

# install python
RUN apt-get install python3 python3-pip python3-venv -y

# install package for pg
RUN apt-get install libpq-dev -y

CMD ["sleep", "infinity"]