FROM alpine:latest

ENV RUBY_BUILD_TAG v20170405
RUN apk update \
        && apk add --update alpine-sdk bash git openssh openssl ruby zlib-dev openssl-dev readline-dev wget \
        && echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc" \
        && git clone https://github.com/rbenv/ruby-build.git ruby-build \
        && cd ruby-build \
        && git checkout tags/$RUBY_BUILD_TAG \
        && ./install.sh \
        && CFLAGS="-O2 -fno-tree-dce -fno-optimize-sibling-calls" \
        && CONFIGURE_OPTS=--no-tcmalloc ruby-build --verbose ree-1.8.7-2012.02 /usr/local/lib/ruby \
        && gem install bundler \
        && apk del alpine-sdk ruby zlib-dev openssl-dev readline-dev \
        && rm -rf /ruby-build \
        && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/local/lib/ruby/bin/* /usr/local/bin
ENV PATH="/usr/local/lib/ruby/bin:${PATH}"






