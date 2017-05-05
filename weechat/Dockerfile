FROM alpine
MAINTAINER Charles Butler <chuck@dasroot.net>

RUN apk add --update-cache weechat-dev openssl weechat \
  && rm -rf /var/cache/apk/*

COPY entrypoint.sh /entrypoint.sh

EXPOSE 9001
ENTRYPOINT ["/entrypoint.sh"]
CMD weechat -r "/relay add ssl.weechat 9001; /set relay.network.password $PASSWORD" 

