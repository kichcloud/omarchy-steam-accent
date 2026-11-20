# Omarchy → Steam live accent

Один демон: читает палитру Omarchy, перекрашивает CSS Steam и применяет его через встроенный CDP-порт. Смена темы отображается в Steam за ~5 секунд без перезапуска.

## Установка / удаление

```bash
git clone https://github.com/kichcloud/omarchy-steam-accent.git
cd omarchy-steam-accent
./install.sh
```

Удаление:

```bash
cd omarchy-steam-accent
./uninstall.sh
```

Плагин пишет только в:
- `~/.local/bin/steam-accent` (скрипт),
- `~/.config/systemd/user/steam-accent.service` (юнит),
- `~/.steam/steam/.cef-enable-remote-debugging` (флаг отладки).

CSS хранится в памяти процесса, промежуточных файлов и хуков нет.

## Требования

Omarchy (`omarchy-theme-color`), Steam (хотя бы один запуск), `python3`, `systemd --user`.

## Проверка вручную

```bash
systemctl --user status steam-accent.service
~/.local/bin/steam-accent --once
STEAM_ACCENT_FORCE='#ff0000' ~/.local/bin/steam-accent --once
```
