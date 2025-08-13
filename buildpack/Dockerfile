FROM ubuntu:24.04

USER root

# update packages
RUN apt-get update && apt-get upgrade -y

# install certs curl unzip software common, and git
RUN apt-get install ca-certificates curl unzip software-properties-common git -y

# install chromium + driver
RUN add-apt-repository ppa:xtradeb/apps -y && \
	apt-get update && \
	apt-get install chromium chromium-driver -y

# install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl" && \
	install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# install helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
	chmod 777 get_helm.sh && \
	./get_helm.sh && \
	rm get_helm.sh

# install java
RUN apt-get install openjdk-21-jdk -y

# install maven
RUN curl -fsSL https://dlcdn.apache.org/maven/maven-3/3.9.8/binaries/apache-maven-3.9.8-bin.tar.gz -o apache-maven-3.9.8-bin.tar.gz && \
	tar -xvf apache-maven-3.9.8-bin.tar.gz && \
	mv apache-maven-3.9.8 /opt/ && \
	rm apache-maven-3.9.8-bin.tar.gz

ENV M2_HOME="/opt/apache-maven-3.9.8"
ENV PATH="$M2_HOME/bin:$PATH"

# install node
RUN curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh && \
	sh nodesource_setup.sh && \
	apt-get install -y nodejs && \
	rm nodesource_setup.sh

# install python
RUN apt-get install python3 python3-pip python3-venv -y

# install package for pg
RUN apt-get install libpq-dev -y

CMD ["sleep", "infinity"]