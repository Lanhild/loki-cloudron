#!/bin/bash
set -eu

echo "==> Ensure directories"
mkdir -p /app/data/

if [[ ! -f /app/data/config.yaml ]]; then
  echo "==> Creating configuration template on first run"
  cp /app/pkg/config.yaml /app/data/config.yaml
fi

echo "==> Changing ownership"
chown -R cloudron:cloudron /app/data

echo "==> Starting Atuin server"
exec gosu cloudron:cloudron /app/code/loki --config.file=/app/data/config.yaml