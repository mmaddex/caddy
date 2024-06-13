echo Tailscale starting
./tailscaled --tun=userspace-networking --socks5-server=localhost:1055 & ./tailscale up --authkey=${TS_AUTHKEY} --hostname=customer-ctx-caddy
echo Tailscale started
