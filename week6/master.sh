rm *bt2
rm *sam
rm *xls
rm *bed
rm *.r
rm *.narrow*
rm -r memechip_out
bowtie2-build chr19.fa chr19
for i in *fastq
do
	bowtie2 -x chr19 -U $i -S ${i%fastq}sam
done
macs2 callpeak -t CTCF_ER4.sam -c input_ER4.sam -f SAM -n ER4
macs2 callpeak -t CTCF_G1E.sam -c input_G1E.sam -f SAM -n G1E
awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6}' ER4_peaks.narrowPeak > ER4.bed
awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6}' G1E_peaks.narrowPeak > G1E.bed
bedtools subtract -A -a ER4.bed -b G1E.bed > ER4_G1E.bed
bedtools subtract -A -a G1E.bed -b ER4.bed > G1E_ER4.bed
cat ER4_G1E.bed | sort -nrk5 | head -100 > ER4_G1E_100.bed
./seq_extract.py > ER4_G1E_100.fasta
bedtools getfasta -fi chr19.fa -bed ER4_G1E_100.bed
/usr/local/opt/meme/bin/meme-chip -db motif_databases/JASPAR/JASPAR_CORE_2016.meme -meme-maxw 20 ER4_G1E_100.fasta






















