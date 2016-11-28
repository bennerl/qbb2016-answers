#!/usr/bin/env python

import sys

line = sys.stdin.readline()
assert line.startswith( ">" )
#identifier = line[1:].rstrip("\r\n")
identifier = line[1:].split()[0]

sequences = []

while 1:
    line = sys.stdin.readline().rstrip("\r\n")
    if line.startswith(">"):
        break
    else:
        sequences.append(line)
print("%s %s\n" % (identifier, "".join(sequences)))