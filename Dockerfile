FROM fedora:33 as builder

RUN dnf install -y zola

WORKDIR /web

COPY content/ content/
COPY sass/ sass/
COPY static/ static/
COPY templates/ templates/
COPY config.toml .

RUN zola build

FROM caddy/caddy:alpine

COPY --from=builder /web/public/ /usr/share/caddy/
