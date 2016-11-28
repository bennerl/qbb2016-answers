#!/usr/bin/env python


import sys, fasta


k = int( sys.argv[1] )

for ident, sequence in fasta.FASTAReader( sys.stdin ):
    sequence = sequence.upper()
    kmer_counts = {}
    for i in range(0, len( sequence ) - k ):
        kmer = sequence[i : i + k ]
        if kmer not in kmer_counts:
            kmer_counts[kmer] = 0
        kmer_counts[kmer] += 1
    print "----", ident, "----"
    for i, kmer in enumerate(sorted(kmer_counts, key=kmer_counts.get, reverse = True)):
        if i > 10:
            break
        print kmer, kmer_counts[kmer]
