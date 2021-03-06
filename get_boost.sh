#! /bin/sh
BOOST_URL=https://dl.bintray.com/boostorg/release/1.67.0/source/boost_1_67_0.tar.gz

(curl -L $BOOST_URL --output boost.tar.gz \
&& tar -xf boost.tar.gz \
&& rm boost.tar.gz \
&& cd boost_* \
&& ./bootstrap.sh --prefix=$BOOST_PREFIX --with-toolset=$BOOST_TOOLSET \
&& ./b2 --without-python install)
