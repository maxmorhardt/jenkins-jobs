FROM ubuntu:24.04

ENV JDK_VERSION="21"
ENV HELM VERSION="v3.19.0" 

USER root

RUN apt-get update && apt-get install -y curl ca-certificates apt-transport-https

RUN curl -LO -o /tmp/helm.tar.gz https://get.helm.sh/helm-${HELM_VERSION}-linux-arm64.tar.gz
RUN tar -xz -C /usr/local/bin --strip-components=1 -f /tmp/helm.tar.gz linux-arm64/helm
RUN chmod +x /usr/local/bin/helm
RUN rm /tmp/helm.tar.gz

# setup for apt installs
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y software-properties-common && \
	rm -rf /var/lib/apt/lists/*

RUN add-apt-repository -y ppa:apt-fast/stable && \
	add-apt-repository -y ppa:xtradeb/apps && \
    apt-get update && \
    apt-get install -y apt-fast && \
	rm -rf /var/lib/apt/lists/*

# install required ci/cd packages
RUN apt-fast update && apt-fast install -y  \
	ca-certificates \
	curl \
	unzip \
	git \
	chromium \
	chromium-driver \
	openjdk-${JDK_VERSION}-jdk \
	maven \
	nodejs \
	npm \
	libpq-dev && \
	rm -rf /var/lib/apt/lists/*

# install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl" && \
	install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

CMD ["sleep", "infinity"]