#!/bin/bash
set -eu

echo "==> Ensure directories"
mkdir -p /app/data/

if [[ ! -f /app/data/config.yaml ]]; then
  echo "==> Creating configuration template on first run"
  cp /app/pkg/config.yaml.template /app/data/config.yaml
fi

echo "==> Changing ownership"
chown -R cloudron:cloudron /app/data

echo "==> Starting Grafana Loki"
exec gosu cloudron:cloudron /app/code/loki-linux-amd64 --config.file=/app/data/config.yaml