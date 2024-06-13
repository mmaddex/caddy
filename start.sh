#!/bin/sh

# https://tailscale.com/kb/1190/caddy-certificates
# https://caddy.community/t/https-in-your-vpn-caddy-now-uses-tls-certificates-from-tailscale/15380
echo Tailscale starting
./tailscaled --tun=userspace-networking --socks5-server=localhost:1055 & ./tailscale up --authkey=${TS_AUTHKEY} --hostname=customer-ctx-caddy
echo Tailscale started
#caddy
#https://github.com/caddyserver/caddy-docker/blob/645721b4b87b6c3a692641213853ce064eb82fe2/2.8/alpine/Dockerfile#L61C5-L61C83
caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
