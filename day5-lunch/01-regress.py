#!/usr/bin/env python
import sys
import pandas as pd
import numpy as np
import statsmodels.api as sm
files = sys.argv[1:]
for i in files:
    df = pd.read_table(i, header = None)
    print i
    fpkm = df[4]
    mean = df[5]
    model = sm.OLS(fpkm, mean)
    results = model.fit()
    print "#################     %s     #################\n" % i.replace(".bed", "")
    print results.summary()
    print results.rsquared
    print fpkm.mean()
    print mean.mean()
    print "\n\n\n\n\n"
    #print sm.regression.linear_model.RegressionResults()