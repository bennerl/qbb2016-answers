#!/usr/bin/env python
import sys
import pandas as pd
import numpy as np
import statsmodels

df = pd.read_table(sys.argv[1])
chromosomes = ["2R", "2L", "X", "4", "3L", "3R"]

for i in df.itertuples():
    chr = i[2]
    if chr not in chromosomes:
        continue
    t_name = i[6]
    fpkm = i[12]
    if i[3] == "+":
        start = i[4] - 500
        end = i[4] + 500
    else:
        start = i[5] - 500
        end = i[5] + 500
    print "%s\t%d\t%d\t%s\t%d" % (chr, start, end, t_name, fpkm)

