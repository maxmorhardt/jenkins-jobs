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
RUN curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | tee /usr/share/keyrings/helm.gpg > /dev/null && \
	apt-get install apt-transport-https -y && \
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list && \
	apt-get update && \
	apt-get install helm

# install java
RUN apt-get install openjdk-21-jdk -y

# install maven
RUN apt-get install maven

# install node
RUN apt-get install nodejs npm -y

# install python
RUN apt-get install python3 python3-pip python3-venv -y

# install package for pg
RUN apt-get install libpq-dev -y

CMD ["sleep", "infinity"]