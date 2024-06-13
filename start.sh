# https://tailscale.com/kb/1190/caddy-certificates
# https://caddy.community/t/https-in-your-vpn-caddy-now-uses-tls-certificates-from-tailscale/15380
echo Tailscale starting
./tailscaled --tun=userspace-networking --socks5-server=localhost:1055 & ./tailscale up --authkey=${TS_AUTHKEY} --hostname=customer-ctx-caddy
echo Tailscale started
