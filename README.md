# websocat-template

This template deploys a WebSocket proxy server using `websocat`. The proxy server will run in Kubernetes (OpenShift OKD/Rahti), and it will create a connection to a service configured by the user and a WebSocket entry point listening to traffic. To open the TCP tunnel, `websocat` is required to be run also on the client side.

Traffic will come to the `websocat` client to the configured port, it will be then translated to be transmitted using a "binary WebSocket", and relayed to the WebSocket entry point in OpenShift OKD/Rahti. This traffic will be "translated back" to the original format before `websocat` was involved and relayed to the configured service in the configured port.

## Building the `websocat` image

This template includes already a pre-built image (hosted in Rahti's docker registry). A Dockerfile is included if you for some reason would need to rebuild the image. As `websocat` in programmed in Rust, the Dockerfile simply uses `cargo` to build the image,

```Dockerfile
FROM rust

RUN cargo install --features=ssl websocat

ENTRYPOINT ["websocat"]
```
