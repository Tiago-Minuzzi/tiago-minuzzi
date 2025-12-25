FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

WORKDIR /desenv

RUN apt update && apt install -y --no-install-recommends \
    build-essential \
    mingw-w64-x86-64-dev \
    golang
