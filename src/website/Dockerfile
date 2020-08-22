# syntax=docker/dockerfile-upstream:experimental
FROM rust:alpine AS build
WORKDIR /usr/src/giveawaybot-canary/website

RUN apk add openssl-dev musl-dev 

COPY . .
# RUN cargo install --path .
RUN --mount=type=cache,target=target \
    --mount=type=cache,target=/usr/local/cargo/git \
    --mount=type=cache,target=/usr/local/cargo/registry \
    cargo build --release

RUN --mount=type=cache,target=target \
    cp ./target/release/website /usr/local/bin/website

FROM alpine:latest
COPY --from=build /usr/local/bin/website /website
COPY .env .
COPY ./static ./static
EXPOSE 8133
CMD ["/website"]