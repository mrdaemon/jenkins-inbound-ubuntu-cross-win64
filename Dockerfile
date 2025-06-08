FROM mrdaemon/jenkins-inbound-agent-ubuntu:latest

USER root

VOLUME /home/jenkins/.ccache

ENV CCACHE_BASEDIR=/home/jenkins
ENV CCACHE_DIR=/home/jenkins/.ccache
ENV CCACHE_MAXSIZE=500M

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    ccache\ 
    g++-mingw-w64 \
    gcc-multilib \
    meson \
    nasm \
    ninja-build \
    pkgconf \
    wget \
    wine64 \
    wine && \
    rm -rf /var/cache/* /tmp/* /var/lib/apt/lists/*

USER jenkins