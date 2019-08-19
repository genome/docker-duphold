FROM ubuntu:xenial
MAINTAINER Alexander Paul <alex.paul@wustl.edu>

RUN apt-get update -y && apt-get install -y \
    wget 

ENV DUPHOLD_INSTALL_DIR=/opt/duphold
ENV DUPHOLD_VERSION=0.1.4

RUN mkdir $DUPHOLD_INSTALL_DIR
WORKDIR $DUPHOLD_INSTALL_DIR

RUN wget https://github.com/brentp/duphold/releases/download/v${DUPHOLD_VERSION}/duphold_static \
  && chmod +x duphold_static \
  && ln -s $DUPHOLD_INSTALL_DIR/duphold_static /usr/bin/duphold

WORKDIR /