#!/usr/bin/env bash
# Env vars (set in Railway): REPO_URL, RUNNER_TOKEN (short-lived, from repo Settings > Actions > Runners)
set -euo pipefail
./config.sh --url "$REPO_URL" --token "$RUNNER_TOKEN" \
  --name "railway-$(hostname)" --labels railway --unattended --replace
cleanup() { ./config.sh remove --token "$RUNNER_TOKEN" || true; }
trap cleanup EXIT
./run.sh
