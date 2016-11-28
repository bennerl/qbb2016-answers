#!/usr/bin/env python
# file.keys()
# [u'0.counts', u'0.expected', u'0.positions', u'regions']
import sys
import h5py
import numpy as np
file = h5py.File(sys.argv[1])
counts = file['0.counts'][...]
expected = file['0.expected'][...]
pos_mat = file['0.positions'][...]
reg = file['regions'][...]
chrom_start = reg[0][4]
chrom_end = reg[0][5]

df = open(sys.argv[2])
pos_list = []
for line in df:
    line = line.split("\t")
    if line[0] == "chrX" and int(line[1]) > chrom_start and int(line[1]) < chrom_end:
        pos_list.append(line[1])
df.close()

for pos in pos_list:
    val = 0
    for i, line in enumerate(pos_mat):
        if int(pos) > line[0] and int(pos) < line[1]:
            for num in range(0, len(pos_mat)):
                if np.log((counts[i][num] + 1) / (expected[i][num] + 1)) > val:
                    val = np.log((counts[i][num] + 1) / (expected[i][num] + 1))
                    largest_peak = pos_mat[num]
            peak_start = line[0]
            peak_end = line[1]
            peak_inter_start = largest_peak[0]
            peak_inter_end = largest_peak[1]
            print "%s %s %s-%s %s %s-%s %s %s" % (pos, "is within", peak_start, peak_end, "and interacts with", peak_inter_start, peak_inter_end, "with a value =", val)
