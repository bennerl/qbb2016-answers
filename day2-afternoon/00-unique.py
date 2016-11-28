#!/usr/bin/env python

import sys

#gene_names_seen = []
#gene_names_seen = {}
gene_names_seen = set()

for i, line in enumerate( sys.stdin ):
    if i == 0:
        continue
    fields = line.rstrip( "\r\n" ).split( "\t" )
    gene_name = fields[9]
    if gene_name not in gene_names_seen:
        #gene_names_seen.append( gene_name )
        #gene_names_seen[ gene_name ] = True
        gene_names_seen.add( gene_name )
for gene_name in gene_names_seen:
    print gene_name
    
    
    