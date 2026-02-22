#!/usr/bin/env bash

set -eu -o pipefail

curl -fsSL https://claude.ai/install.sh | bash

curl -fsSL https://opencode.ai/install | bash

npm install -g @google/gemini-cli
