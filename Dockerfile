FROM debian:stretch

ENV KIMCHI_VERSION="2.5.0"

RUN \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
    gcc \
    git \
    make \
    curl \
    autoconf \ 
    automake \
    gettext pkgconf \
    xsltproc \ 
    python

RUN curl -LO https://github.com/kimchi-project/kimchi/archive/$KIMCHI_VERSION.tar.gz && \
  tar -xvf $KIMCHI_VERSION.tar.gz && \
  cd kimchi-$KIMCHI_VERSION && \
  ./autogen.sh --system && \
  make && \
  make deb && \
  mkdir /build && \
  cp *.deb /build/kimchi-$KIMCHI_VERSION.deb

