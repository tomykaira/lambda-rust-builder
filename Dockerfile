FROM ghcr.io/cargo-lambda/cargo-lambda:latest

RUN apt update && \
	apt install -y musl-tools jq && \
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
	unzip awscliv2.zip && \
	./aws/install && \
	rm -rf aws awscliv2.zip && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /src
