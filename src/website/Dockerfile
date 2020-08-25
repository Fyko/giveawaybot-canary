# syntax=docker/dockerfile-upstream:experimental
FROM rust:alpine as build

RUN apk add --update \
&& apk add --no-cache ca-certificates \
&& apk add --no-cache --virtual .build-deps git curl build-base openssl-dev musl-dev

RUN rustup target add x86_64-unknown-linux-musl

COPY . . 

# Build with mounted cache
RUN --mount=type=cache,target=target \
    --mount=type=cache,target=/usr/local/cargo/git \
    --mount=type=cache,target=/usr/local/cargo/registry \
	cargo build --release --target x86_64-unknown-linux-musl

# Copy binaries into normal layers
RUN --mount=type=cache,target=target \
    cp ./target/x86_64-unknown-linux-musl/release/website /usr/local/bin/website

FROM alpine:latest
EXPOSE 8133
RUN apk --no-cache add ca-certificates
COPY --from=build /usr/local/bin/website .
COPY .env .
COPY ./static/ ./static/
CMD ["./website"]