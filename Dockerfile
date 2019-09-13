FROM abiosoft/caddy:1.0.3
COPY run.sh /
COPY Caddyfile /etc/Caddyfile
ENTRYPOINT [ "/run.sh" ]