FROM linuxbrew/brew:3.2.5 as builder

RUN brew install zola

WORKDIR /web

COPY content/ content/
COPY sass/ sass/
COPY static/ static/
COPY templates/ templates/
COPY config.toml .

RUN zola build

FROM caddy:alpine

COPY --from=builder /web/public/ /usr/share/caddy/
