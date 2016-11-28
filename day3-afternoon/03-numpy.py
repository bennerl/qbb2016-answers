#!/usr/bin/env python
import sys 
import numpy as np
#import statsmodels.stats.weightstats
from statsmodels.stats.weightstats import ttest_ind as ttest

def load_fpkm_from_ctab(my_ctab_filename):
    fpkm_values = []
    for i, line in enumerate(open(my_ctab_filename)):
        if i == 0:
            continue
        fields = line.rstrip("\r\n").split("\t")
        fpkm = float(fields[11])
        fpkm_values.append(fpkm)
    return np.array(fpkm_values)


a = load_fpkm_from_ctab(sys.argv[1])
b = load_fpkm_from_ctab(sys.argv[2])

print "Correlation: {}".format(np.corrcoef(a,b)[0,1])
print "t-test t-stat: {}, p-value: {}, dof: {}".format( ttest(a,b)[0], ttest(a,b)[1], ttest(a,b)[2])

#a = np.array(fpkm_values)

#print a
#print a.shape
#print a.dtype
#print np.mean(a)
#print np.std(a)
#print np.max(a)
#print np.min(a)

#print fpkm_values