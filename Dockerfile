FROM rust:1.51.0

RUN curl -o- -L https://slss.io/install | bash && \
	rustup target add x86_64-unknown-linux-musl && \
	apt update && \
	apt install -y musl-tools jq
ENV PATH="/root/.serverless/bin:$PATH"
WORKDIR /src
