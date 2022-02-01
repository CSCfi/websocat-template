FROM rust

RUN cargo install --features=ssl websocat

ENTRYPOINT ["websocat"]
