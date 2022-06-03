#!/bin/sh
apt install -y gcc sqlite3 libsqlite3-dev dbus-user-session libnss3-tools
which go || (
    wget https://go.dev/dl/go1.18.3.linux-amd64.tar.gz \
    && rm -rf /usr/local/go \
    && tar -C /usr/local -xzf go1.18.3.linux-amd64.tar.gz \
    && ln -s /usr/local/go/bin/go /usr/local/bin/go
)

which caddy || (
    wget 'https://caddyserver.com/api/download?os=linux&arch=amd64&idempotency=18430356115926' \
    && mv 'download?os=linux&arch=amd64&idempotency=18430356115926' /usr/local/bin/caddy \
    && chmod +x /usr/local/bin/caddy \
    && setcap CAP_NET_BIND_SERVICE=+eip /usr/local/bin/caddy
)

which litestream || (
    wget https://github.com/benbjohnson/litestream/releases/download/v0.3.8/litestream-v0.3.8-linux-amd64.deb \
    && dpkg -i litestream-v0.3.8-linux-amd64.deb
)