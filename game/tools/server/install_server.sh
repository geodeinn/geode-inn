#!/usr/bin/env bash
# Installs The Geode Inn server on a fresh Ubuntu or Debian machine as a
# service that starts on boot and restarts if it ever stops.
#
#   sudo ./install_server.sh ./geode-inn-server.x86_64 [port]
#
# Re-run it with a newer binary to update; the world data is kept.
set -euo pipefail

BIN="${1:-}"
PORT="${2:-24770}"
APP_DIR=/opt/geode-inn
DATA_HOME=/var/lib/geode-inn
SERVICE=/etc/systemd/system/geode-inn.service

if [[ $EUID -ne 0 ]]; then
  echo "Run this with sudo." >&2
  exit 1
fi
if [[ -z "$BIN" || ! -f "$BIN" ]]; then
  echo "Usage: sudo $0 ./geode-inn-server.x86_64 [port]" >&2
  exit 1
fi
if ! [[ "$PORT" =~ ^[0-9]+$ ]] || (( PORT < 1024 || PORT > 65535 )); then
  echo "The port must be a number from 1024 to 65535." >&2
  exit 1
fi

# A user of its own, no login, its home is where the world is kept.
if ! id geodeinn >/dev/null 2>&1; then
  useradd --system --home-dir "$DATA_HOME" --create-home --shell /usr/sbin/nologin geodeinn
fi

mkdir -p "$APP_DIR"
systemctl stop geode-inn 2>/dev/null || true
install -m 0755 "$BIN" "$APP_DIR/geode-inn-server.x86_64"

cat > "$SERVICE" <<EOF
[Unit]
Description=The Geode Inn server
After=network-online.target
Wants=network-online.target

[Service]
User=geodeinn
WorkingDirectory=$APP_DIR
Environment=HOME=$DATA_HOME
ExecStart=$APP_DIR/geode-inn-server.x86_64 --headless -- --server --port $PORT
Restart=always
RestartSec=3
# Ask it to stop politely (it also saves every 30 seconds).
KillSignal=SIGINT
TimeoutStopSec=20

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable --now geode-inn

# Open the port if the firewall is on (ENet uses UDP).
if command -v ufw >/dev/null 2>&1 && ufw status | grep -q "Status: active"; then
  ufw allow "$PORT"/udp
fi

DATA_DIR="$DATA_HOME/.local/share/godot/app_userdata/The Geode Inn/server_data"
echo
echo "The Geode Inn server is running on UDP port $PORT."
echo "World data:      $DATA_DIR"
echo "Faire rentals:   $DATA_DIR/rentals.json"
echo "Status and logs: systemctl status geode-inn   /   journalctl -u geode-inn -f"
echo "If the host has its own firewall (cloud panel), open UDP $PORT there too."
