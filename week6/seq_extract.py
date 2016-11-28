#!/usr/bin/env python
import sys, fasta
fasta_file = open("/Users/cmdb/qbb2016-answers/week6/chr19.fa")
bed = open("/Users/cmdb/qbb2016-answers/week6/ER4_G1E_100.bed")
for ident, seq in fasta.FASTAReader(fasta_file):
    for line in bed:
        line = line.rstrip("\r\n").split("\t")
        seq_ident = ">" + line[0] + "_" + str(line[1]) + "_" + str(line[2])
        bed_seq = seq[int(line[1]):(int(line[2]) + 1)]
        print "%s\n%s" % (seq_ident, bed_seq)


