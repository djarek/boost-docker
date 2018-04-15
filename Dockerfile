FROM gcc:7.3.0
MAINTAINER Damian Jarek <damian.jarek93@gmail.com>

ARG BOOST_URL

ENV BOOST_PREFIX=/usr/local \
    BOOST_TOOLSET=gcc \
    WORK_DIR=/root \
    BOOST_URL=$BOOST_URL

RUN apt-get update && apt-get install -y \
    make \
    curl \
&& rm -rf /var/lib/apt/lists/* \
&& curl -L $BOOST_URL --output boost.tar.gz \
&& tar -xf boost.tar.gz \
&& cd boost_* \
&& ./bootstrap.sh \
&& ./b2 --without-python headers \
&& ./b2 --without-python -j2 \
&& ./b2 --without-python install \
&& cd .. \
&& rm -rf boost boost.tar.gz

ENTRYPOINT /bin/bash
