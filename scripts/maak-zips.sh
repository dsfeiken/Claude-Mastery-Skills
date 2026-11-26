#!/usr/bin/env bash
# Maakt per skill een ZIP-bestand in downloads/, klaar om te downloaden via de README.
# Elke ZIP bevat de skillmap zelf (bijv. promptcoach/SKILL.md), zoals de Claude-app verwacht.
set -euo pipefail
cd "$(dirname "$0")/../skills"
rm -rf ../downloads && mkdir -p ../downloads
for skill in */; do
  naam="${skill%/}"
  zip -qr "../downloads/${naam}.zip" "$naam" -x '*.DS_Store'
  echo "downloads/${naam}.zip"
done
