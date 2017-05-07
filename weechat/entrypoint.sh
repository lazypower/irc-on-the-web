#!/bin/sh

set -e

if [ -z "${PASSWORD}" ]; then
  echo "This container must be run with a password value."
  echo "docker run -td -e PASSWORD=mypassword -p 9001:9001 lazypower/weechat"
  exit 1
fi

WEECHAT_HOME=/home/weechat/.weechat

if [ ! -d "${WEECHAT_HOME}/ssl" ]
then
	echo "Creating self-signed certificate. This may take a while..."
	mkdir -p "${WEECHAT_HOME}/ssl/" && \
	openssl req -nodes -newkey rsa:4096 \
		-keyout "${WEECHAT_HOME}/ssl/relay.pem" -x509 -days 365 \
		-out "${WEECHAT_HOME}/ssl/relay.pem" -subj "/CN=localhost/"
fi

exec "$@"
