#!/usr/bin/env bash
set -eu -o pipefail

# Install terminfo entries for modern terminals so they work when connecting
# from Kitty, WezTerm, Alacritty, Ghostty, etc. via SSH.
#
# kitty-terminfo  → xterm-kitty  (Kitty)
# ncurses-term    → wezterm      (WezTerm)
#                 → alacritty    (Alacritty)
#                 → ghostty      (Ghostty — covers TERM=ghostty)
# foot-terminfo   → foot         (foot)
#
# TODO: xterm-ghostty — Ghostty sets TERM=xterm-ghostty but no apt package exists yet.
#       Once available: apt-get install -y ghostty-terminfo

sudo apt-get install -y --no-install-recommends kitty-terminfo ncurses-term foot-terminfo
