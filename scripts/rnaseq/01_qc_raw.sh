#!/usr/bin/env bash
set -euo pipefail
mkdir -p fastqc_output
fastqc -t 4 sourcedata/*.fastq.gz -o fastqc_output
multiqc fastqc_output -o multiqc_report
