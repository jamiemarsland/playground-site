#!/bin/bash
# Copies each demo's uploads from the WP Engine backup into media/<skin>/
cd "$(dirname "$0")"
U="../site-archive-wpskins-live-1792723164-7sbrIltrDPXOuBBwip7k5biGlhy9WBXVVUVg/wp-content/uploads"
mkdir -p media
for pair in croyde:main barossa:sites/11 poppie:sites/7 showcase:sites/6 startup:sites/4 streamliner:sites/9; do
  s=${pair%%:*}; src=${pair#*:}; mkdir -p media/$s
  if [ "$src" = main ]; then cp -R "$U"/2018 "$U"/2019 "$U"/2020 media/$s/; else cp -R "$U/$src"/. media/$s/; fi
  echo "$s done"
done
