#!/usr/bin/env bash
systemctl --user disable --now steam-accent.service >/dev/null 2>&1 || true
rm -f "$HOME/.config/systemd/user/steam-accent.service" \
      "$HOME/.local/bin/steam-accent" \
      "$HOME/.steam/steam/.cef-enable-remote-debugging"
systemctl --user daemon-reload >/dev/null 2>&1 || true
echo "removed"
