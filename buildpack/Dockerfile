FROM ubuntu:24.04

ENV JDK_VERSION="21"
ENV NODE_VERSION="22"

USER root

# setup for apt installs
RUN apt-get update && apt-get install -y \
	software-properties-common \
	curl \
	ca-certificates \
	apt-transport-https && \
	rm -rf /var/lib/apt/lists/*

# node repo setup
RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x -o nodesource_setup.sh && \
	chmod +x nodesource_setup.sh && \
	./nodesource_setup.sh && \
	rm -f nodesource_setup.sh

# chromium and helm repo setup
RUN add-apt-repository -y ppa:xtradeb/apps && \
    echo "deb [trusted=yes] https://packages.buildkite.com/helm-linux/helm-debian/any/ any main" | tee /etc/apt/sources.list.d/helm-stable-debian.list

RUN apt-get update && apt-get install -y \
	unzip \
	git \
	chromium \
	chromium-driver \
	openjdk-${JDK_VERSION}-jdk \
	maven \
	nodejs \
	helm \
	libpq-dev && \
	rm -rf /var/lib/apt/lists/*

# install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl" && \
	install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

CMD ["sleep", "infinity"]