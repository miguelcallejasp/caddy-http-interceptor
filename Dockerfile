FROM abiosoft/caddy:1.0.3

RUN apk add python3
RUN apk add py3-pip
RUN pip3 install Flask requests

COPY black_hole.py /
COPY run.sh /
COPY Caddyfile /etc/Caddyfile
ENTRYPOINT [ "/run.sh" ]