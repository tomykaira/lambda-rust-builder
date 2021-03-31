FROM rust:1.51.0

RUN curl -o- -L https://slss.io/install | bash && \
	rustup target add x86_64-unknown-linux-musl && \
	apt update && \
	apt install -y musl-tools jq && \
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
	unzip awscliv2.zip && \
	./aws/install && \
	rm -rf aws awscliv2.zip && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

ENV PATH="/root/.serverless/bin:/usr/local/bin:$PATH"
WORKDIR /src
