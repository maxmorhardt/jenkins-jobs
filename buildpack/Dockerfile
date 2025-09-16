FROM ubuntu:24.04

USER root

# update packages
RUN apt-get update && apt-get upgrade -y

# apt-fast
RUN add-apt-repository -y ppa:apt-fast/stable
RUN add-apt-repository -y ppa:xtradeb/apps
RUN apt-get update
RUN apt-get install -y apt-fast

# install required ci/cd packages
RUN apt-fast install -y  \
	ca-certificates \
	curl \
	unzip \
	software-properties-common \
	git \
	chromium \
	chromium-driver \
	openjdk-21-jdk \
	maven \
	nodejs \
	npm \
	libpq-dev

# install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl" && \
	install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# install helm
RUN snap install helm --classic

CMD ["sleep", "infinity"]