#!/usr/bin/env python

test_string = [ "foo", "bar", "baz", "quux" ]

#print("\t".join( test_string))

def print_sep( a_string, sep = "\t" ):
    print( sep.join( a_string ) )

print_sep( test_string )
print_sep( test_string, " - " )