FROM cloudron/base:5.0.0@sha256:04fd70dbd8ad6149c19de39e35718e024417c3e01dc9c6637eaf4a41ec4e596c

RUN mkdir -p /app/code /app/pkg
WORKDIR /app/code

ARG VERSION=3.5.1

RUN wget https://github.com/grafana/loki/releases/download/v${VERSION}/loki-linux-amd64.zip -O loki-linux-amd64.zip && \
  unzip loki-linux-amd64.zip -d /app/code/ && \
  rm -rf loki-linux-amd64.zip

RUN wget -O /app/pkg/config.yaml https://raw.githubusercontent.com/grafana/loki/v${VERSION}/cmd/loki/loki-local-config.yaml

COPY start.sh /app/pkg/

CMD [ "/app/pkg/start.sh" ]
