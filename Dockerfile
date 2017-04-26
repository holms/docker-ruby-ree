FROM alpine:latest

ENV RUBY_BUILD_TAG v20170405
RUN apk update \
        && apk add --update build-base bash git vim openssh openssl ruby zlib-dev openssl-dev readline-dev wget \
        && rm -rf /var/cache/apk

RUN git clone https://github.com/rbenv/ruby-build.git ruby-build \
        && cd ruby-build \
        && git checkout tags/$RUBY_BUILD_TAG \
        && ./install.sh \
        && rm -rf /ruby-build

RUN echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc"
RUN CFLAGS="-O2 -fno-tree-dce -fno-optimize-sibling-calls" \
    CONFIGURE_OPTS=--no-tcmalloc \
    ruby-build --verbose ree-1.8.7-2012.02 /usr/local/lib/ruby
RUN ln -s /usr/local/lib/ruby/bin/* /usr/local/bin
RUN gem install bundler




