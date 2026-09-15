#!/usr/bin/env bash
# Build and publish dist/ to the gh-pages branch (GitHub Pages source).
# Stopgap until the Actions workflow in .github/workflows/deploy.yml can be pushed (needs `gh auth refresh -s workflow`).
set -euo pipefail
cd "$(dirname "$0")"
npm run build
tmp=$(mktemp -d)
cp -R dist/. "$tmp"/ && touch "$tmp/.nojekyll"
git -C "$tmp" init -q -b gh-pages
git -C "$tmp" add -A
git -C "$tmp" -c user.name="JT Embry" -c user.email="jtembryjr@gmail.com" commit -q -m "Deploy $(date '+%Y-%m-%d %H:%M')"
git -C "$tmp" push -q --force https://github.com/jtembry/flourish-financial-group.git gh-pages
rm -rf "$tmp"
echo "Deployed → https://flourishfinancialgroup.org"
