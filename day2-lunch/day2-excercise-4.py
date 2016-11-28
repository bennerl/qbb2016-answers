#!/usr/bin/env python


import sys
count = 0
f = open(sys.argv[1])

for lines in f:
    if lines.startswith("SRR"):
        print(lines.split("\t")[2])
        count += 1
        if count == 10:
            break