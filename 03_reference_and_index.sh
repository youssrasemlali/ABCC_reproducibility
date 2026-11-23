#!/usr/bin/env bash
# Matching genome + annotation from Ensembl Fungi release-62 (CEN.PK113-7D, GCA_000269885).
# Mixing NCBI FASTA with Ensembl GFF3 fails due to chromosome-name mismatches.
set -euo pipefail
mkdir -p reference star_index
cd reference

# Place the Ensembl release-62 files here (toplevel DNA FASTA + GFF3), then:
gunzip -f Saccharomyces_cerevisiae_cen_pk113_7d_gca_000269885.ASM26988v1.dna.toplevel.fa.gz
mv Saccharomyces_cerevisiae_cen_pk113_7d_gca_000269885.ASM26988v1.dna.toplevel.fa CENPK1137D_ensembl.fa

# GFF3 -> GTF for STAR / featureCounts
gffread CENPK1137D.gff3 -T -o CENPK1137D.gtf
cd ..

STAR --runMode genomeGenerate \
     --genomeDir star_index \
     --genomeFastaFiles reference/CENPK1137D_ensembl.fa \
     --sjdbGTFfile reference/CENPK1137D.gtf \
     --sjdbOverhang 84
