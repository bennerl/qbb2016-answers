#!/usr/bin/env python

import sys
number = 0
f = open(sys.argv[1])
for line in f.readlines():
    if line.startswith("SRR"):
        number = number + 1
print(number)