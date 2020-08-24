# syntax=docker/dockerfile-upstream:experimental
FROM rust:latest
EXPOSE 8133

RUN apt-get update && apt-get install musl-tools -y

COPY . .

RUN cargo build --release

CMD ["./target/release/website"]
