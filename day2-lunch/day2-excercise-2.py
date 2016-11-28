#!/usr/bin/env python


import sys
count = 0
f = open(sys.argv[1])

for lines in f.readlines():
    if "NM:i:0" in lines:
        count = count + 1
print(count)