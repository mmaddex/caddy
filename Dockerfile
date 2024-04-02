# adopted from https://kofi.sexy/blog/zero-downtime-render-disk
FROM caddy
RUN setcap -r /usr/bin/caddy
COPY <<EOF /etc/caddy/Caddyfile
:10000 {
  reverse_proxy http://$DOWNSTREAM_APP:10000 {
    lb_try_duration 60s
  }
}
EOF
