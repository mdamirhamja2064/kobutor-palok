#!/usr/bin/env bash
# অফলাইন লাইব্রেরি তৈরি: Tailwind CSS, html2canvas, JSZip, Firebase, ফন্ট -> www/vendor
set -euo pipefail
V=www/vendor
rm -rf "$V"; mkdir -p "$V/fonts"

# Tailwind: index.html থেকে ব্যবহৃত ক্লাস বের করে ছোট CSS ফাইল বানায়
printf '@tailwind base;\n@tailwind components;\n@tailwind utilities;\n' > /tmp/tw-input.css
npx tailwindcss -i /tmp/tw-input.css -o "$V/tailwind.css" --content "./www/index.html" --minify

cp node_modules/html2canvas/dist/html2canvas.min.js "$V/"
cp node_modules/jszip/dist/jszip.min.js "$V/"
cp node_modules/firebase/firebase-app-compat.js "$V/"
cp node_modules/firebase/firebase-firestore-compat.js "$V/"

copy_font () { # $1=package $2=folder $3...=weights
  pkg=$1; dir=$2; shift 2
  mkdir -p "$V/fonts/$dir/files"
  for w in "$@"; do
    cp "node_modules/@fontsource/$pkg/$w.css" "$V/fonts/$dir/$w.css"
    cp node_modules/@fontsource/$pkg/files/*-$w-normal.woff2 "$V/fonts/$dir/files/" 2>/dev/null || true
    cp node_modules/@fontsource/$pkg/files/*-$w-normal.woff "$V/fonts/$dir/files/" 2>/dev/null || true
  done
}
copy_font noto-sans-bengali noto-sans-bengali 500 700 800
copy_font hind-siliguri hind-siliguri 400 500 600 700

echo "vendor ready:"; du -sh "$V"; ls "$V" "$V/fonts"
