#!/usr/bin/env python

import sys
import pandas as pd

df = pd.read_csv (sys.argv[1])
# print df[ "sample"]
# print df[0:5]
# print df["sample"][0:5]

print df["sex"] == "female"



"""
file = open(sys.argv[1])

for i, line in enumerate(file):
    if i == 0:
        continue
    fields = line.strip( "\r\n" ).split( "," )
    print fields[0]
    
file.close()


"""