# adopted from https://kofi.sexy/blog/zero-downtime-render-disk
FROM caddy
RUN setcap -r /usr/bin/caddy
ARG DOWNSTREAM_HOST
ARG DOWNSTREAM_PORT=10000
ARG PORT
#COPY Caddyfile /etc/caddy/Caddyfile
RUN --mount=type=secret,id=caddyfile,dst=/etc/secrets/caddyfile cat /etc/secrets/caddyfile
RUN ls /etc/caddy/
RUN --mount=type=secret,id=caddyfile,dst=/etc/secrets/caddyfile cat /etc/secrets/caddyfile > /etc/caddy/Caddyfile
