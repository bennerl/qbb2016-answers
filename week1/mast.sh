rm seq.txt
blastn -db nr -remote -evalue 0.0001 -max_target_seqs 1000 -outfmt "6 sseqid qstart qend sseq" -query week1_query.fa >> seq.txt
rm rem_seq.txt
cat week1_query.fa > rem_seq.txt
#filter on seq that are full length
awk '$2 == 1 {print ">"$1"\t"$3"\t"$4}' seq.txt | sed 's|-||g' | awk '$2 == 10293 {print $1"\n"$3}' >> rem_seq.txt
rm pro_seq.txt
transeq -sequence rem_seq.txt -outseq pro_seq.txt
rm aligned_seq.txt
mafft pro_seq.txt > aligned_seq.txt
./aa_nc.py 
