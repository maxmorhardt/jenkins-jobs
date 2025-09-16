FROM ubuntu:24.04

USER root





# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    apt-transport-https \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Add Helm GPG key and repo
RUN curl https://baltocdn.com/helm/signing.asc | gpg --dearmor -o /usr/share/keyrings/helm.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" \
       > /etc/apt/sources.list.d/helm-stable-debian.list

# Install Helm
RUN apt-get update && apt-get install -y helm \
    && rm -rf /var/lib/apt/lists/*

# Verify installation
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