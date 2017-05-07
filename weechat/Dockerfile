FROM alpine
MAINTAINER Charles Butler <chuck@dasroot.net>

RUN apk add --update-cache weechat-dev openssl weechat \
  && rm -rf /var/cache/apk/*

RUN adduser -D -g "" -s /bin/sh  weechat

COPY entrypoint.sh /entrypoint.sh
USER weechat
EXPOSE 9001
ENTRYPOINT ["/entrypoint.sh"]
CMD weechat -r "/relay add ssl.weechat 9001; /set relay.network.password $PASSWORD" 

