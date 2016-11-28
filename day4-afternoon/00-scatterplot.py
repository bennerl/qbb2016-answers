#!/usr/bin/env python

#match series.str.match

import sys
import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_table( sys.argv[1] )
df2 = pd.read_table( sys.argv[2] )



plt.figure()
plt.scatter( df[ "FPKM" ] + 1, df2[ "FPKM" ] + 1, alpha = 0.1)
plt.xscale("log")
plt.yscale("log")
plt.savefig( "scatterplot.png")
plt.close()


plt.figure()
plt.hexbin( df[ "FPKM" ] + 1, df2[ "FPKM" ] + 1)
plt.xscale("log")
plt.yscale("log")
plt.savefig( "scatterplot_hexbin.png")
plt.close()
