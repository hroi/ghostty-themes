#!/bin/sh

set -euo pipefail

KITTY_THEMES_DIR=../kitty-themes/themes

if [ ! -d "$KITTY_THEMES_DIR" ]; then
  printf "missing themes dir in %s\n" "$KITTY_THEMES_DIR"
  exit 1
fi

for f in "$KITTY_THEMES_DIR"/*.conf; do
  themename=$(basename "${f/.conf}")
  ./convert-from-kitty.gawk < "$f" > ./themes/"$themename"
done
