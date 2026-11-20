#!/usr/bin/env bash
set -euo pipefail
D="$(cd -- "$(dirname -- "$0")" && pwd)"
mkdir -p "$HOME/.local/bin" "$HOME/.config/systemd/user" "$HOME/.steam/steam"
install -m755 "$D/steam-accent.py" "$HOME/.local/bin/steam-accent"
cat > "$HOME/.config/systemd/user/steam-accent.service" <<'EOF'
[Unit]
Description=Omarchy live accent bridge for Steam

[Service]
Type=simple
ExecStart=%h/.local/bin/steam-accent
Restart=always
RestartSec=5

[Install]
WantedBy=default.target
EOF
touch "$HOME/.steam/steam/.cef-enable-remote-debugging"
systemctl --user daemon-reload
systemctl --user enable --now steam-accent.service
echo "installed: ~/ .local/bin/steam-accent + steam-accent.service"
