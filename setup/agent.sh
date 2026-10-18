#!/usr/bin/env bash

set -eu -o pipefail

curl -fsSL https://claude.ai/install.sh | bash
mkdir -p ~/.claude/
cp /setup/user/claude/settings.json ~/.claude/

# opencode 2, never 1: opencode.ai/install only installs opencode 1 and
# refuses 2.x by design, so this reads the version the Dockerfile fetched
# (the release-metadata ADD keys the cache on new releases) and runs the v2
# installer with it explicitly. The version must say 2.* or the build stops,
# rather than quietly shipping opencode 1 (Martin, 2026-10-18).
version="$(sed -n 's/.*"version":"\([^"]*\)".*/\1/p' /tmp/opencode-latest.json)"
case "$version" in
  2.*) ;;
  *) echo "no opencode 2 version in release metadata:" >&2; cat /tmp/opencode-latest.json >&2; exit 1 ;;
esac
curl -fsSL https://opencode.ai/v2/install | bash -s -- --version "$version"
/home/node/.opencode/bin/opencode --version

npm install -g @google/gemini-cli
