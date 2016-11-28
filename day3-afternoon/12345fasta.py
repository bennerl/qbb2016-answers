#!/usr/bin/env python

import sys
import fasta
        


reader = fasta.FASTAReader( sys.stdin )

#while 1:
#    identifier, sequence = reader.next()
#    if identifier is None:
#        break
#    print identifier, sequence

for identifier, sequence in reader:
    print identifier, sequence

