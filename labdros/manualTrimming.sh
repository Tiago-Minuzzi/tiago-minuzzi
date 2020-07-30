#!/usr/bin/env bash
# Remove adapters and arctifacts from sequences

# Input files
ADAPS="adapters.txt"
FASTA="file.fasta"

# Remove adapters from sequences
sed -f <(awk '{ print length, $0 }' "$ADAPS" | sort -rn | cut -d" " -f2- | sed -E 's/(.*)/s|&||/') "$FASTA"
