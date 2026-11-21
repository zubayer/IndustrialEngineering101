#!/usr/bin/env bash
# Push the prepared ForgeIE project into the existing GitHub repository.
# This script does not store tokens or erase unrelated repository files.
set -euo pipefail
REMOTE="https://github.com/zubayer/IndustrialEngineering101.git"
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
if ! command -v git >/dev/null 2>&1; then
  echo "Git is not installed. Install Git first or use GitHub's browser upload." >&2
  exit 1
fi
if [[ ! -f "$SOURCE_DIR/index.html" || ! -f "$SOURCE_DIR/assets/js/app.js" ]]; then
  echo "Run this from the extracted package with all folders intact." >&2
  exit 1
fi
WORKDIR="$(mktemp -d)"
trap 'rm -rf "$WORKDIR"' EXIT
printf 'Cloning %s ...\n' "$REMOTE"
git clone "$REMOTE" "$WORKDIR/repo"
cd "$WORKDIR/repo"
for path in index.html README.md .gitignore netlify.toml assets docs tests scripts; do
  if [[ -e "$path" ]]; then echo "Existing path will be updated/merged: $path"; fi
done
printf '\nContinue copying the ForgeIE files into this clone? [y/N]: '
read -r answer
[[ "$answer" == "y" || "$answer" == "Y" ]] || { echo 'Cancelled before changes.'; exit 0; }
for path in index.html README.md .gitignore netlify.toml assets docs tests scripts; do cp -R "$SOURCE_DIR/$path" .; done
git add -- index.html README.md .gitignore netlify.toml assets docs tests scripts
if git diff --cached --quiet; then echo 'No changes to commit.'; exit 0; fi
git diff --cached --stat
printf '\nCommit and push these files to the current default branch? [y/N]: '
read -r approval
[[ "$approval" == "y" || "$approval" == "Y" ]] || { echo 'Cancelled before commit/push.'; exit 0; }
git commit -m 'Add ForgeIE learning academy and Netlify deployment configuration'
git push origin HEAD
printf '\nPush completed. Verify at: https://github.com/zubayer/IndustrialEngineering101\n'
