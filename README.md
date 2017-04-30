# ruby-ree-alpine

Alpine version of Ruby enterprise edition.

This images is minified as much as possible, everything happens in one layer!
So if you want to use it keep it at minimum futher you need to do the same with your futher builds:
```
RUN apk update \
        && apk add --update alpine-sdk zlib-dev openssl-dev readline-dev \
        && apk del alpine-sdk ruby zlib-dev openssl-dev readline-dev \
        && <do your stuff here> \
        && rm -rf /var/cache/apk
```
