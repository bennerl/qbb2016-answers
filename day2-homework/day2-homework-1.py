#!/usr/bin/env python

import sys

for line in sys.stdin:
    if "DROME" in line:
        line = line.rstrip("\r\n").split( )
        if "DROME" in line[0]:
            continue
        else:
            print( "%s\t%s" % (line[3], line[2]))