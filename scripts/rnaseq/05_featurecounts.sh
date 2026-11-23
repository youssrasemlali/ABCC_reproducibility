#!/usr/bin/env bash
set -euo pipefail
mkdir -p counts
featureCounts \
  -T 4 \
  -s 0 \
  -a reference/CENPK1137D.gtf \
  -o counts/gene_counts.txt \
  alignments/*_Aligned.sortedByCoord.out.bam
