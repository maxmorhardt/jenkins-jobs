FROM ubuntu:24.04

ENV JDK_VERSION="21"

USER root



RUN apt-get update && apt-get upgrade -y && apt-get install curl gpg apt-transport-https wget --yes
RUN wget -O helm.asc https://packages.buildkite.com/helm-linux/helm-debian/gpgkey
RUN cat helm.asc
RUN gpg --dearmor helm.asc > helm.gpg
RUN cat helm.gpg
RUN mv helm.gpg /usr/share/keyrings/helm.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/helm.gpg] https://packages.buildkite.com/helm-linux/helm-debian/any/ any main" | tee /etc/apt/sources.list.d/helm-stable-debian.list
RUN apt-get update
RUN apt-get install helm



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