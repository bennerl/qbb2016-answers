#!/usr/bin/env python

import sys

ident = open(sys.argv[1])
ctab = open(sys.argv[2])
ctab_diction = {}
arg = sys.argv[3]

for line in ctab:
    gene_id = line.rstrip("\r\n").split("\t")[8]
    if gene_id not in ctab_diction:
        ctab_diction[(gene_id)] = line
count = 0    
for flybase in ident:
    flybase_id = flybase.rstrip("\r\n").split("\t")[0]
    uniprot_id = flybase.rstrip("\r\n").split("\t")[1]
    if flybase_id in ctab_diction:
        if arg == "1":
            print(ctab_diction[(flybase_id)] + " " + uniprot_id)
            count += 1
            if count > 100:
                break
        elif arg == "2":
            print(ctab_diction[(flybase_id)] + " no uniprot ID")
            count += 1
            if count > 100:
                break