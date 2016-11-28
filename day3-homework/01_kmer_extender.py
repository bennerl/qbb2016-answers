#!/usr/bin/env python


import sys, fasta

query_fasta = open(sys.argv[1])
query_fasta_2 = open(sys.argv[1])
query_fasta_3 = open(sys.argv[1])
target_fasta = open(sys.argv[2])
k = int(sys.argv[3])
kmer_query = {}
target_gene = {}

for ident, sequence in fasta.FASTAReader(query_fasta):
    sequence = sequence.upper()
    for i in range(0, len( sequence ) - k ):
        start = i
        kmer = sequence[i : i + k ]
        if kmer not in kmer_query:
            kmer_query[kmer] = [start]
        else:
            kmer_query[kmer].append(start)
#    for i, kmer in enumerate(kmer_query):
#        print kmer, kmer_query[kmer]


target_dict = {}
for ident, sequence in fasta.FASTAReader(target_fasta):
    sequence = sequence.upper()
    target_kmer = {}
    target_dict[ident] = sequence
    for i in range(0, len( sequence ) - k ):
    #for g, i in enumerate(range(0, len( sequence ) - k )):
        start = i
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





#kmer_query#target_dict#target_gene


answer_dic = {}
for query_ident, query_sequence in fasta.FASTAReader(query_fasta_2): #read sequence name and sequence
    for gene in target_gene: #read gene key in target dict 
        for kmer in target_gene[gene]: #read kmer key in gene key
            if kmer in kmer_query: #read kmer key in query dict
                for target_start in target_gene[gene][kmer]: #for every start position in kmer key in gene key, not int
                    for query_start in kmer_query[kmer]: #for every start position in kmer key in query dict, not int
                        target_start = int(target_start)
                        query_start = int(query_start)
                        query_end = int(query_start) + k 
                        target_end = int(target_start) + k
                        match = True

                        while match == True:
                            query_end += 1
                            target_end += 1
                            query_match = query_sequence[query_start:query_end]
                            target_match = target_dict[gene][target_start:target_end]
                            if query_match == target_match:
                                continue
                            else:
                                query_end -= 1
                                target_end -= 1
                                element = [query_start, target_start]
                                target_match = target_dict[gene][target_start:target_end]
                                if target_match not in answer_dic:
                                    answer_dic[target_match] = [element]
                                answer_dic[target_match].append(element)
                                match = False
                                
                                
"""                                
for i in sorted(answer_dic, key=lambda i: len(i), reverse = True):
    print i
 """                        
for i in sorted(answer_dic, key=lambda i: len(i)):
    print len(i)
                               
                            

