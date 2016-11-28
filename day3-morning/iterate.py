#!/usr/bin/env python
l = ["a", "b", "c", "d", "e", "f"]

i = 0
while True:
    if i == len(l):
        break
    print l[i]
    i += 1

for x in l:
    print x
    
it = iter(l)
while True:
    try:
        print it.next()
    except StopIteration:
        break
