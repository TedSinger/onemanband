wget 'https://caddyserver.com/api/download?os=linux&arch=amd64&idempotency=18430356115926' > /home/blurb/caddy
sudo setcap CAP_NET_BIND_SERVICE=+eip /home/blurb/caddy