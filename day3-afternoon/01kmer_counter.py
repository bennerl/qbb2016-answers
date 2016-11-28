#!/usr/bin/env python


import sys, fasta


k = int( sys.argv[1] )
kmer_counts = {}

for ident, sequence in fasta.FASTAReader( sys.stdin ):
    sequence = sequence.upper()
    for i in range(0, len( sequence ) - k ):
        kmer = sequence[i : i + k ]
        if kmer not in kmer_counts:
            kmer_counts[kmer] = 0
        kmer_counts[kmer] += 1
for kmer in sorted(kmer_counts, key=kmer_counts.get, reverse = True):
    print kmer, kmer_counts[kmer]
