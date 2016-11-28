#!/usr/bin/env python

import sys
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

def extract_Sxl(table):
    table_Sxl = table[table["gene_name"] == "Sxl"]
    table_Sxl_FPKM = table_Sxl[table_Sxl["FPKM"] > 0]
    table_log = np.log(table_Sxl_FPKM["FPKM"])
    return table_log

df1 = pd.read_table( sys.argv[1] )
df2 = pd.read_table( sys.argv[2] )

value1 = extract_Sxl(df1)
value2 = extract_Sxl(df2)

print value1

plt.figure()
plt.boxplot([value1, value2], labels=["value1", "value2"])
plt.title("log FPKM values Sxl")
plt.ylabel("log FPKM")
plt.savefig("sxl.png")
plt.close()





