#!/usr/bin/env bash
# Adapter trimming (single-end RNA-seq). cutadapt installed via pip on the HPC node.
set -euo pipefail
mkdir -p trimmed
for f in sourcedata/*.fastq.gz; do
  filename=$(basename "$f")
  sample=${filename%.fastq.gz}
  cutadapt \
    -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA \
    -q 20 \
    -m 30 \
    --max-n 3 \
    -o "trimmed/${sample}_trimmed.fastq.gz" \
    "$f" \
    > "trimmed/${sample}_cutadapt.log"
  echo "Finished trimming $sample"
done

mkdir -p fastqc_trimmed_output
fastqc -t 4 -o fastqc_trimmed_output trimmed/*.fastq.gz
multiqc fastqc_trimmed_output -o multiqc_trimmed_report
