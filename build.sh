#! /bin/sh

set -e

SASSC_VERSION=3.2.5
LIBSASS_VERSION=3.2.5
SASS_LIBSASS_PATH=/usr/local/libsass-$LIBSASS_VERSION

apk add --update \
      curl \
      g++ \
      make
rm -rf /var/cache/apk/*

cd /usr/local

# Fetch
curl -L https://github.com/sass/libsass/archive/$LIBSASS_VERSION.tar.gz | tar xvz
curl -L https://github.com/sass/sassc/archive/$SASSC_VERSION.tar.gz | tar xvz

# Compile
cd /usr/local/sassc-$SASSC_VERSION
make

# Clean
cp /usr/local/sassc-$SASSC_VERSION/bin/sassc /usr/local/bin/sassc
rm -rf /usr/local/sassc-$SASSC_VERSION \
       /usr/local/libsass-$LIBSASS_VERSION

apk del curl make
