FROM gcc:7.3.0
MAINTAINER Damian Jarek <damian.jarek93@gmail.com>

ENV BOOST_PREFIX=/usr/local \
    BOOST_TOOLSET=gcc \
    WORK_DIR=/root

COPY get_boost.sh /root/get_boost.sh

RUN apt-get update && apt-get install -y \
    curl \
&& rm -rf /var/lib/apt/lists/* \
&& cd /root \
&& ./get_boost.sh \
&& cd boost_* \
&& ./bootstrap.sh \
&& ./b2 --without-python headers \
&& ./b2 --without-python -j2 \
&& ./b2 --without-python install \
&& cd .. \
&& rm -rf /root/*

ENTRYPOINT /bin/bash
