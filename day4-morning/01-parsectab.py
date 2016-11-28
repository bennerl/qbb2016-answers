#!/usr/bin/env python

import sys
import pandas as pd

df_ctab = pd.read_csv( sys.argv[1], sep="\t" )
df2_ctab = pd.read_csv( sys.argv[1], sep="\t")
# print df_ctab.head()
# print df_ctab.describe()
#
#
# df_roi = df_ctab["FPKM"] > 1000
# print df_ctab[df_roi]

# df_roi = df_ctab[ "gene_name" ] == "fzo"
# print df_ctab[df_roi]

df_roi = df_ctab["FPKM"] > 1000
df_high_exp = df_ctab[df_roi]
print df_high_exp["gene_name"]



df2_roi = df2_ctab[ "FPKM" ] > 1000
df2_high_exp = df2_ctab[ df2_roi ]


df_overlap = pd.merge( df_high_exp, df2_high_exp, on="gene_name")
print df_overlap