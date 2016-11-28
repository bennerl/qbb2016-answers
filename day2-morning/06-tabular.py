#!/usr/bin/env python

import sys

for line in sys.stdin:
    if line.startswith("t_id"):
        print line.rstrip("\r\n")
        continue
    fields = line.rstrip("\r\n").split("\t")
    length = int( fields[4] ) - int( fields[3] )
    fields.append( str(length) )
    print "\t".join( fields )