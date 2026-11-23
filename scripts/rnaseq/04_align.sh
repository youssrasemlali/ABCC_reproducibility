#!/usr/bin/env bash
set -euo pipefail
mkdir -p alignments
for fq in trimmed/*_trimmed.fastq.gz; do
  sample=$(basename "$fq" _trimmed.fastq.gz)
  STAR --runThreadN 8 --readFilesCommand zcat \
       --outSAMtype BAM SortedByCoordinate \
       --quantMode GeneCounts \
       --genomeDir star_index \
       --readFilesIn "$fq" \
       --outFileNamePrefix "alignments/${sample}_"
done
