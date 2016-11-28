#!/bin/bash

./00-assignement.py ~/data/results/stringtie/SRR072893/t_data.ctab > transcripts.bed

for i in *.bw 
do 
	bigWigAverageOverBed -bedOut=${i%bw}bed $i transcripts.bed ${i%bw}tab
done

./01-regress.py *3.bed > output.txt
#rm *tab