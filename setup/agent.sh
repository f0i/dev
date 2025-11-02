#!/usr/bin/env bash

set -eu -o pipefail

npm install -g @anthropic-ai/claude-code

curl -fsSL https://opencode.ai/install | bash

npm install -g @google/gemini-cli
