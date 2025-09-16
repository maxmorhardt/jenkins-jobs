FROM ubuntu:24.04

USER root




# Install deps and Helm
RUN apt-get update && apt-get install -y \
      curl \
      apt-transport-https \
      gnupg \
    && curl -fsSL https://baltocdn.com/helm/signing.asc | apt-key add - \
    && echo "deb https://baltocdn.com/helm/stable/debian/ all main" \
        > /etc/apt/sources.list.d/helm-stable-debian.list \
    && apt-get update \
    && apt-get install -y helm \
    && rm -rf /var/lib/apt/lists/*

# Verify
RUN helm version



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
	openjdk-21-jdk \
	maven \
	nodejs \
	npm \
	libpq-dev && \
	rm -rf /var/lib/apt/lists/*

# install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl" && \
	install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

CMD ["sleep", "infinity"]