#!/usr/bin/env python

import sys

class FASTAReader(object):
    def __init__( self, file ):
        self.file = file
        self.last_id = None
    def next( self ):
        if self.last_id is None:
            line = self.file.readline()
            #line = sys.stdin.readline()
            assert line.startswith( ">" )
            #identifier = line[1:].rstrip("\r\n")
            identifier = line[1:].split()[0]
        else:
            identifier = self.last_id

        sequences = []

        while 1:
            line = sys.stdin.readline().rstrip("\r\n")
            if line.startswith(">"):
                self.last_id = line[1:].split()[0]
                break
            elif line == "":
                return None, None #indicate end
            else:
                sequences.append(line)
        return identifier, "".join(sequences)
        


reader = FASTAReader( sys.stdin )

while 1:
    identifier, sequence = reader.next()
    if identifier is None:
        break
    print identifier, sequence

