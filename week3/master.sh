bwa index merged.fa

for i in *fq
do
	bwa mem -t 4 merged.fa ${i} > ${i%fq}sam
done

for i in *sam
do
	samtools sort ${i} -o ${i%sam}bam
	samtools index ${i%sam}bam
done

for i in *bam
do
	freebayes -f merged.fa --min-coverage 5 ${i} > ${i%bam}filtered.vcf
done

for i in *bam
do
	freebayes -f merged.fa ${i} > ${i%bam}unfiltered.vcf
done

for i in *vcf
do
	snpEff GRCm38.82 ${i} > ${i%vcf}ann.vcf
done

