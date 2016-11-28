#!/usr/bin/env python


import sys, fasta

query_fasta = open(sys.argv[1])
target_fasta = open(sys.argv[2])
k = int(sys.argv[3])
kmer_query = {}
target_gene = {}

for ident, sequence in fasta.FASTAReader(query_fasta):
    sequence = sequence.upper()
    for i in range(0, len( sequence ) - k ):
        start = i
        end = i + k
        kmer = sequence[i : i + k ]
        if kmer not in kmer_query:
            kmer_query[kmer] = [start]
        else:
            kmer_query[kmer].append(start)
#    for i, kmer in enumerate(kmer_query):
#        print kmer, kmer_query[kmer]



for ident, sequence in fasta.FASTAReader(target_fasta):
    sequence = sequence.upper()
    target_kmer = {}
    for i in range(0, len( sequence ) - k ):
    #for g, i in enumerate(range(0, len( sequence ) - k )):
        start = i
        end = i + k
        kmer = sequence[i : i + k ]
        #if kmer in kmer_query:
        #    print ident, start, kmer_query[kmer], kmer
        #if g == 5:
        #    break 
        if kmer not in target_kmer:
            target_kmer[kmer] = [start]
        else:
            target_kmer[kmer].append(start)
    target_gene[ident] = target_kmer

print

for gene in target_gene:
    for i, kmer in enumerate(target_gene[gene]):
        if kmer in kmer_query:
            print gene, target_gene[gene][kmer], kmer_query[kmer], kmer
        if i == 1000:
            break
#        print kmer, target_gene[gene][kmer]

    
    
#k = int( sys.argv[1] )

#for ident, sequence in fasta.FASTAReader( query_fasta ):
#    sequence = sequence.upper()
#    kmer_counts = {}
#    for i in range(0, len( sequence ) - k ):
#        kmer = sequence[i : i + k ]
#        if kmer not in kmer_counts:
#            kmer_counts[kmer] = 0
#        kmer_counts[kmer] += 1
#    print "----", ident, "----"
#    for i, kmer in enumerate(sorted(kmer_counts, key=kmer_counts.get, reverse = True)):
#        if i > 10:
#            break
#        print kmer, kmer_counts[kmer]
