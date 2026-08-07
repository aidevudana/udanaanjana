#!/usr/bin/env bash
# Copies the Virtuo template assets into this project.
#
#   ./setup.sh /path/to/Virtuo-PHP-Template
#
# The assets folder (~63 MB) is not bundled with this project — it's part of
# your purchased ThemeForest licence, so it stays in your own copy.

set -euo pipefail

TEMPLATE_ROOT="${1:-}"

if [[ -z "$TEMPLATE_ROOT" ]]; then
  echo "Usage: ./setup.sh /path/to/Virtuo-PHP-Template"
  echo
  echo "Example:"
  echo "  ./setup.sh ~/Downloads/Virtuo-PHP-Template"
  exit 1
fi

SRC="$TEMPLATE_ROOT/main-files/virtuo/assets"

if [[ ! -d "$SRC" ]]; then
  echo "Could not find: $SRC"
  echo "Point this at the folder that contains main-files/virtuo/assets"
  exit 1
fi

echo "Copying assets from $SRC ..."
rm -rf ./assets
cp -R "$SRC" ./assets

echo
echo "Done. Assets copied ($(du -sh ./assets | cut -f1))."
echo
echo "Next:"
echo "  npx serve .        # or use the VS Code Live Server extension"
echo "  open http://localhost:3000"
