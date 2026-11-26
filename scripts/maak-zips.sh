#!/usr/bin/env bash
# Maakt per skill een ZIP-bestand in dist/, klaar om te uploaden bij een GitHub Release.
# Elke ZIP bevat de skillmap zelf (bijv. promptcoach/SKILL.md), zoals de Claude-app verwacht.
set -euo pipefail
cd "$(dirname "$0")/../skills"
rm -rf ../dist && mkdir -p ../dist
for skill in */; do
  naam="${skill%/}"
  zip -qr "../dist/${naam}.zip" "$naam" -x '*.DS_Store'
  echo "dist/${naam}.zip"
done
