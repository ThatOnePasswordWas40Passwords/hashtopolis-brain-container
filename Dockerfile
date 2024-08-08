########################################################################################
# BUILDER IMAGE
########################################################################################
FROM alpine:latest as build-img
ENV DEBIAN_FRONTEND=NONINTERACTIVE

RUN apk update && apk --no-cache add git build-base linux-headers  && rm -rf /var/cache/apk/*

WORKDIR /tmp

RUN git clone --depth=1 https://github.com/hashcat/hashcat && \
    cd hashcat && \
    make


########################################################################################
# RUNNER IMAGE
########################################################################################
FROM alpine:latest

LABEL org.opencontainers.image.licenses=MIT
LABEL org.opencontainers.image.description="Containerized hashcat brain for running alongside hashtopolis in compose setup"
LABEL org.opencontainers.image.source=https://github.com/ThatOnePasswordWas40Passwords/hashtopolis-brain-container
LABEL org.opencontainers.image.maintainer="ThatOnePasswordWas40Passwords"

COPY --from=build-img /tmp/hashcat/hashcat /usr/local/bin/

EXPOSE 9876
ENTRYPOINT ["hashcat", "--brain-server", "--brain-port", "9876"]
