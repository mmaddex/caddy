# adopted from https://kofi.sexy/blog/zero-downtime-render-disk
FROM caddy
RUN setcap -r /usr/bin/caddy
ARG DOWNSTREAM_HOST
ARG DOWNSTREAM_PORT=10000
ARG PORT
#COPY Caddyfile /etc/caddy/Caddyfile
WORKDIR /srv

COPY --from=docker.io/tailscale/tailscale:stable /usr/local/bin/tailscaled ./tailscaled
COPY --from=docker.io/tailscale/tailscale:stable /usr/local/bin/tailscale ./tailscale
RUN mkdir -p /var/run/tailscale /var/cache/tailscale /var/lib/tailscale

RUN --mount=type=secret,id=caddyfile,dst=/etc/secrets/caddyfile cat /etc/secrets/caddyfile
RUN ls /etc/caddy/
RUN --mount=type=secret,id=caddyfile,dst=/etc/secrets/caddyfile cat /etc/secrets/caddyfile > /etc/caddy/Caddyfile

ARG TS_AUTHKEY
CMD ["tailscaled --tun=userspace-networking --socks5-server=localhost:1055 & tailscale up --authkey=${TS_AUTHKEY} --hostname=customer-ctx-caddy"]
