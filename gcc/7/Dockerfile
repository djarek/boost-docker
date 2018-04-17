FROM gcc:7
MAINTAINER Damian Jarek <damian.jarek93@gmail.com>

ENV BOOST_PREFIX=/usr/local \
    BOOST_TOOLSET=gcc \
    WORK_DIR=/root

COPY get_boost.sh /root/get_boost.sh

WORKDIR $WORK_DIR

RUN apt update && apt install -y \
    curl \
    cmake \
    lcov \
&& rm -rf /var/lib/apt/lists/* \
&& cd $WORK_DIR \
&& ./get_boost.sh \
&& rm -rf $WORK_DIR/* \
&& apt purge -y curl

ENTRYPOINT /bin/bash
