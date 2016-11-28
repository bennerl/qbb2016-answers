rm pheno.txt
rm plink*
rm alleles.txt
rm *png
plink2 --pca 2 --vcf BYxRM_GenoData.vcf 
plink2 --freq --vcf BYxRM_GenoData.vcf
awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6}' plink.frq > alleles.txt
HEADER=$(awk 'NR==1' BYxRM_PhenoData.txt)
printf "%s\t%s%s\n" "FID" "IID" "$HEADER" > pheno.txt
awk 'NR>1' BYxRM_PhenoData.txt | tr '_' '\t' >> pheno.txt
plink2 --assoc --vcf BYxRM_GenoData.vcf --pheno pheno.txt --allow-no-sex --all-pheno
for i in *qassoc
do
	awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9}' $i > temp.txt
	rm $i; mv temp.txt $i
done
RScript graph.R
