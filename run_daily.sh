#!/usr/bin/env bash
#更改 GITHUB_REPO 部分的链接 https://github.com/*/*.git 为你的仓库连接
set -euo pipefail

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

export GITHUB_REPO="${GITHUB_REPO:-https://github.com/*/*.git}"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Starting daily IP update"
python3 "$ROOT/update.py" --no-github-sync
"$ROOT/push_results.sh"
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Daily IP update finished"
