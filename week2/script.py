#!/usr/bin/env python

import sys, fasta
import numpy as np



velvet_low = open("velvet_reads_low/contigs.fa")
spades_low = open("spades_reads_low/contigs.fasta")
velvet_high = open("velvet_reads_high/contigs.fa")
spades_high = open("spades_reads_high/contigs.fasta")

lengths = []
def func(file):
    for ident, seq in fasta.FASTAReader(file):
        lengths.append(len(seq))
    print np.median(lengths)
    print min(lengths)
    print max(lengths)
    print np.mean(lengths)
    print ""


func(velvet_low)
func(spades_low)

func(velvet_high)
func(spades_high)