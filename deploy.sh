#!/usr/bin/env bash
# FALLBACK ONLY. Normal deploys happen automatically when you push to main (.github/workflows/deploy.yml).
# This builds the site and force-pushes dist/ to a gh-pages branch. Only useful if GitHub Actions is unavailable
# and Pages is switched back to "Deploy from a branch: gh-pages".
set -euo pipefail
cd "$(dirname "$0")"
npm run build
remote=$(git remote get-url origin)
tmp=$(mktemp -d)
cp -R dist/. "$tmp"/ && touch "$tmp/.nojekyll"
git -C "$tmp" init -q -b gh-pages
git -C "$tmp" add -A
git -C "$tmp" commit -q -m "Deploy $(date '+%Y-%m-%d %H:%M')"
git -C "$tmp" push -q --force "$remote" gh-pages
rm -rf "$tmp"
echo "Pushed gh-pages to $remote"
