#!/usr/bin/env bash
# Download RNA-seq FASTQs from ENA. One URL per line in data/rnaseq_urls.txt
set -euo pipefail
mkdir -p sourcedata
while read -r url; do
  [[ -z "$url" || "$url" == \#* ]] && continue
  wget -nc -P sourcedata "$url"
done < data/rnaseq_urls.txt
