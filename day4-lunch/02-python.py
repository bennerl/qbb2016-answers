#!/usr/bin/env python

import sys
import pandas as pd
import matplotlib.pyplot as plt

df1 = pd.read_table( sys.argv[1] )
df2 = pd.read_table( sys.argv[2] )
window_size = sys.argv[3]
chromosome = ["2L", "2R", "3L", "3R", "4", "X"]
files = [df1, df2]

def roll_plot(chr):
    output_list = []
    for i in files:    
        df_chrom = i[i["chr"] == chr]
        df_chrom_FPKM_roll = df_chrom["FPKM"].rolling( int(window_size) ).mean()
        output_list.append(df_chrom_FPKM_roll)
    plt.figure()
    #plt.plot([output_list])
    plt.plot(output_list[0], label = "sample1")
    plt.plot(output_list[1], label = "sample2")    
    plt.title("Rolling mean (size = " + window_size + ") for " + chr)
    plt.savefig(chr + "_plot.png")
    plt.close()
for i in chromosome:
    roll_plot(i)







