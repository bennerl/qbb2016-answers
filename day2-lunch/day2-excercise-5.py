#!/usr/bin/env python


import sys
value = 0
total_value = 0
read = 0
f = open(sys.argv[1])

for lines in f:
    if lines.startswith("SRR"):
        if lines.split("\t")[4] != "255" and lines.split("\t")[4] != "0":
            value = lines.split("\t")[4]
            total_value += int(value)
            read += 1
print(total_value / read)