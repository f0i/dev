#!/usr/bin/env bash
set -eu -o pipefail
sudo apt-get install -y tmux

mkdir -p "$HOME/.config/tmux"
cat > "$HOME/.config/tmux/tmux.conf" << 'TMUXCONF'
set -g default-terminal "tmux-256color"
set -ag terminal-overrides ",*:Tc"  # true color passthrough
set -g mouse on
set -g extended-keys on
set -g extended-keys-format csi-u               # Kitty keyboard protocol format
TMUXCONF
