
import sys

class FASTAReader(object):
    def __init__( self, file ):
        self.file = file
        self.last_id = None
    
    def __iter__(self):
        return self
    
    def next( self ):
        if self.last_id is None:
            line = self.file.readline()
            if line == "":
                raise StopIteration
            #line = sys.stdin.readline()
            assert line.startswith( ">" )
            #identifier = line[1:].rstrip("\r\n")
            identifier = line[1:].split()[0]
        else:
            identifier = self.last_id

        sequences = []

        while 1:
            line = self.file.readline().rstrip("\r\n")
            if line.startswith(">"):
                self.last_id = line[1:].split()[0]
                break
            elif line == "":
                if sequences:
                    return identifier, "".join(sequences)
                raise StopIteration #indicate end
            else:
                sequences.append(line)
        return identifier, "".join(sequences)
        
