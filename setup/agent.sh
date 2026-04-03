#!/usr/bin/env bash

set -eu -o pipefail

curl -fsSL https://claude.ai/install.sh | bash
mkdir -p ~/.claude/
cp /setup/user/claude/settings.json ~/.claude/

curl -fsSL https://opencode.ai/install | bash

npm install -g @google/gemini-cli
