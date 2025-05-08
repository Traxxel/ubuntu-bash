#!/bin/bash

# 1. git installieren, falls noch nicht vorhanden
if ! command -v git &> /dev/null; then
    echo "Git wird installiert..."
    sudo apt-get update
    sudo apt-get install -y git
else
    echo "Git ist bereits installiert."
fi

# 2. tmux-plugin-manager (tpm) klonen
echo "Tmux Plugin Manager wird installiert..."
mkdir -p ~/.tmux/plugins/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# 3. tmux-Konfigurationsdatei herunterladen
echo "Tmux-Konfigurationsdatei wird heruntergeladen..."
curl -L https://github.com/aibix0001/cfg/raw/main/tmux/.tmux.conf -o ~/.tmux.conf

# 4. Prüfen, ob tmux installiert ist, und ggf. installieren
if ! command -v tmux &> /dev/null; then
    echo "Tmux wird installiert..."
    sudo apt-get install -y tmux
else
    echo "Tmux ist bereits installiert."
fi

# 5. tmux starten und Konfiguration laden
echo "Tmux wird gestartet und die Konfiguration wird geladen..."
tmux new-session -d
tmux source-file ~/.tmux.conf

echo "Setup abgeschlossen. Du kannst jetzt mit 'tmux attach' zu deiner tmux-Session verbinden."