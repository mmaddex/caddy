# adopted from https://kofi.sexy/blog/zero-downtime-render-disk
FROM caddy
RUN setcap -r /usr/bin/caddy
ARG DOWNSTREAM_APP
COPY Caddyfile /etc/caddy/Caddyfile

