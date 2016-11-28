#!/usr/bin/env python



#f = open("temp.fa")
import sys

#f = sys.stdin
f = open(sys.argv[1])

#print(f)
#print(type(f))
#print(f.read())
for i, line in enumerate(f.readlines()):
    line = line.strip( "\r\n" )
    if line.startswith(">"):
        continue
    print line



