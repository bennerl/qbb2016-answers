wc -l ~/data/BDGP6/BDGP6.Ensembl.85.gtf
  538689 /Users/cmdb/data/BDGP6/BDGP6.Ensembl.85.gtf

grep -c "Sxl" ~/data/BDGP6/BDGP6.Ensembl.85.gtf
grep "Sxl" ~/data/BDGP6/BDGP6.Ensembl.85.gtf | wc -l
     514

cut -f 3 ~/data/BDGP6/BDGP6.Ensembl.85.gtf | sort | uniq

CDS
Selenocysteine
exon
five_prime_utr
gene
start_codon
stop_codon
three_prime_utr
transcript

cut -f 3 ~/data/BDGP6/BDGP6.Ensembl.85.gtf | sort | uniq | sed '/\#\!*/d'
CDS
Selenocysteine
exon
five_prime_utr
gene
start_codon
stop_codon
three_prime_utr
transcript

for i in `cut -f 3 ~/data/BDGP6/BDGP6.Ensembl.85.gtf | sort | uniq | sed '/\#\!*/d'`; do NUMBER=`grep -c $i ~/data/BDGP6/BDGP6.Ensembl.85.gtf`; printf "%s: %s\n" "$i" "$NUMBER"; done
CDS: 160188
Selenocysteine: 4
exon: 407287
five_prime_utr: 46060
gene: 538685
start_codon: 30389
stop_codon: 30296
three_prime_utr: 33034
transcript: 521125

awk 'NR>5' ~/data/BDGP6/BDGP6.Ensembl.85.gtf | awk '{print $1 "\t" $7 "\t" $4 "\t" $5 "\t" $5-$4}' | head -100
3R	-	722370	722621	251
3R	-	722370	722621	251
3R	-	722370	722621	251
3R	+	835381	2503907	1668526
3R	+	835381	2503907	1668526
3R	+	835381	835491	110
3R	+	835381	835491	110
3R	+	835381	835383	2
3R	+	869486	869548	62
3R	+	869486	869548	62
3R	+	895786	895893	107
3R	+	895786	895893	107
3R	+	947426	947570	144
3R	+	947426	947570	144
3R	+	1025040	1025614	574
3R	+	1025040	1025614	574
3R	+	1138730	1138972	242
3R	+	1138730	1138972	242
3R	+	1191610	1191975	365
3R	+	1191610	1191975	365
3R	+	1342196	1342317	121
3R	+	1342196	1342317	121
3R	+	1454572	1455091	519
3R	+	1454572	1455091	519
3R	+	1467146	1467258	112
3R	+	1467146	1467258	112
3R	+	1588295	1588538	243
3R	+	1588295	1588538	243
3R	+	1845561	1846163	602
3R	+	1845561	1846163	602
3R	+	1861194	1861417	223
3R	+	1861194	1861417	223
3R	+	1938067	1938205	138
3R	+	1938067	1938205	138
3R	+	1961120	1961515	395
3R	+	1961120	1961515	395
3R	+	2136430	2137402	972
3R	+	2136430	2137402	972
3R	+	2307285	2307583	298
3R	+	2307285	2307583	298
3R	+	2413805	2414131	326
3R	+	2413805	2414131	326
3R	+	2461182	2461592	410
3R	+	2461182	2461592	410
3R	+	2503677	2503907	230
3R	+	2503677	2503904	227
3R	+	2503905	2503907	2
3R	+	1031171	1031354	183
3R	+	1031171	1031354	183
3R	+	1031171	1031354	183
3R	-	2156916	2157206	290
3R	-	2156916	2157206	290
3R	-	2156916	2157206	290
3R	-	2554124	3263573	709449
3R	-	2554124	3263573	709449
3R	-	3263513	3263573	60
3R	-	3263513	3263573	60
3R	-	3263571	3263573	2
3R	-	3263195	3263456	261
3R	-	3263195	3263456	261
3R	-	3262923	3263146	223
3R	-	3262923	3263146	223
3R	-	3262750	3262870	120
3R	-	3262750	3262870	120
3R	-	3262573	3262692	119
3R	-	3262573	3262692	119
3R	-	3262114	3262480	366
3R	-	3262114	3262480	366
3R	-	3170422	3170666	244
3R	-	3170422	3170666	244
3R	-	3168995	3169540	545
3R	-	3168995	3169540	545
3R	-	3061773	3062322	549
3R	-	3061773	3062322	549
3R	-	3061235	3061718	483
3R	-	3061235	3061718	483
3R	-	3060393	3061173	780
3R	-	3060393	3061173	780
3R	-	3031406	3031536	130
3R	-	3031406	3031536	130
3R	-	2940913	2941229	316
3R	-	2940913	2941229	316
3R	-	2743787	2744070	283
3R	-	2743787	2744070	283
3R	-	2743154	2743729	575
3R	-	2743154	2743729	575
3R	-	2690093	2690237	144
3R	-	2690093	2690237	144
3R	-	2557978	2558354	376
3R	-	2557978	2558354	376
3R	-	2554470	2555023	553
3R	-	2554470	2555023	553
3R	-	2554124	2554398	274
3R	-	2554127	2554398	271
3R	-	2554124	2554126	2
3R	-	2744304	2744800	496
3R	-	2744304	2744800	496
3R	-	2744758	2744800	42
3R	-	2744304	2744698	394
3R	-	2744305	2744800	495

NUM_FEAT=`awk 'NR>5' ~/data/BDGP6/BDGP6.Ensembl.85.gtf | wc -l`; SUM_FEAT=`awk 'NR>5' ~/data/BDGP6/BDGP6.Ensembl.85.gtf | awk '{print $5-$4}' | awk '{sum+=$1} END {print sum}'`; awk -v x="$SUM_FEAT" -v y="$NUM_FEAT" 'BEGIN {print x / y}'
1138
#first 100 lines
awk 'NR>5' ~/data/BDGP6/BDGP6.Ensembl.85.gtf | awk '{if ($7 == "+" && $5-$4 > 1138) {print}}'
3R	FlyBase	gene	835381	2503907	.	+	.	gene_id "FBgn0267431"; gene_name "CG45784"; gene_source "FlyBase"; gene_biotype "protein_coding";
3R	FlyBase	transcript	835381	2503907	.	+	.	gene_id "FBgn0267431"; transcript_id "FBtr0346770"; gene_name "CG45784"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG45784-RA"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	gene	3322810	3354486	.	+	.	gene_id "FBgn0086917"; gene_name "spok"; gene_source "FlyBase"; gene_biotype "protein_coding";
3R	FlyBase	transcript	3322810	3354486	.	+	.	gene_id "FBgn0086917"; transcript_id "FBtr0300207"; gene_name "spok"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "spok-RB"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	exon	3353129	3354486	.	+	.	gene_id "FBgn0086917"; transcript_id "FBtr0300207"; exon_number "2"; gene_name "spok"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "spok-RB"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; exon_id "FBtr0300207-E2";
3R	FlyBase	CDS	3353129	3354378	.	+	2	gene_id "FBgn0086917"; transcript_id "FBtr0300207"; exon_number "2"; gene_name "spok"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "spok-RB"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; protein_id "FBpp0289444";
3R	FlyBase	gene	3623143	3627690	.	+	.	gene_id "FBgn0086378"; gene_name "Alg-2"; gene_source "FlyBase"; gene_biotype "protein_coding";
3R	FlyBase	transcript	3623143	3627690	.	+	.	gene_id "FBgn0086378"; transcript_id "FBtr0301810"; gene_name "Alg-2"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Alg-2-RC"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	gene	3734855	3745306	.	+	.	gene_id "FBgn0263977"; gene_name "Tim17b"; gene_source "FlyBase"; gene_biotype "protein_coding";
3R	FlyBase	transcript	3734855	3745306	.	+	.	gene_id "FBgn0263977"; transcript_id "FBtr0113895"; gene_name "Tim17b"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Tim17b-RA"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	transcript	3734929	3745306	.	+	.	gene_id "FBgn0263977"; transcript_id "FBtr0345179"; gene_name "Tim17b"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Tim17b-RB"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	gene	3750363	3752353	.	+	.	gene_id "FBgn0069923"; gene_name "CG41128"; gene_source "FlyBase"; gene_biotype "protein_coding";
3R	FlyBase	transcript	3750363	3752353	.	+	.	gene_id "FBgn0069923"; transcript_id "FBtr0301812"; gene_name "CG41128"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG41128-RB"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	gene	3846729	3868401	.	+	.	gene_id "FBgn0039955"; gene_name "CG41099"; gene_source "FlyBase"; gene_biotype "protein_coding";
3R	FlyBase	transcript	3846729	3868401	.	+	.	gene_id "FBgn0039955"; transcript_id "FBtr0113989"; gene_name "CG41099"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG41099-RD"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	exon	3866007	3867426	.	+	.	gene_id "FBgn0039955"; transcript_id "FBtr0113989"; exon_number "6"; gene_name "CG41099"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG41099-RD"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; exon_id "FBtr0113989-E6";
3R	FlyBase	CDS	3866007	3867426	.	+	2	gene_id "FBgn0039955"; transcript_id "FBtr0113989"; exon_number "6"; gene_name "CG41099"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG41099-RD"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; protein_id "FBpp0112712";
3R	FlyBase	transcript	3846729	3867980	.	+	.	gene_id "FBgn0039955"; transcript_id "FBtr0344573"; gene_name "CG41099"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG41099-RE"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	exon	3866007	3867426	.	+	.	gene_id "FBgn0039955"; transcript_id "FBtr0344573"; exon_number "6"; gene_name "CG41099"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG41099-RE"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; exon_id "FBtr0113989-E6";
3R	FlyBase	CDS	3866007	3867426	.	+	2	gene_id "FBgn0039955"; transcript_id "FBtr0344573"; exon_number "6"; gene_name "CG41099"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG41099-RE"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; protein_id "FBpp0310922";
3R	FlyBase	transcript	3846729	3867684	.	+	.	gene_id "FBgn0039955"; transcript_id "FBtr0113991"; gene_name "CG41099"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG41099-RB"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	exon	3866007	3867426	.	+	.	gene_id "FBgn0039955"; transcript_id "FBtr0113991"; exon_number "7"; gene_name "CG41099"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG41099-RB"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; exon_id "FBtr0113989-E6";
3R	FlyBase	CDS	3866007	3867426	.	+	2	gene_id "FBgn0039955"; transcript_id "FBtr0113991"; exon_number "7"; gene_name "CG41099"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG41099-RB"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; protein_id "FBpp0112714";
3R	FlyBase	transcript	3846729	3867684	.	+	.	gene_id "FBgn0039955"; transcript_id "FBtr0113990"; gene_name "CG41099"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG41099-RC"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	exon	3866007	3867426	.	+	.	gene_id "FBgn0039955"; transcript_id "FBtr0113990"; exon_number "6"; gene_name "CG41099"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG41099-RC"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; exon_id "FBtr0113989-E6";
3R	FlyBase	CDS	3866007	3867426	.	+	2	gene_id "FBgn0039955"; transcript_id "FBtr0113990"; exon_number "6"; gene_name "CG41099"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG41099-RC"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; protein_id "FBpp0112713";
3R	FlyBase	gene	4077939	4104326	.	+	.	gene_id "FBgn0259821"; gene_name "CG42402"; gene_source "FlyBase"; gene_biotype "protein_coding";
3R	FlyBase	transcript	4077939	4104326	.	+	.	gene_id "FBgn0259821"; transcript_id "FBtr0336454"; gene_name "CG42402"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG42402-RD"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	exon	4102500	4104326	.	+	.	gene_id "FBgn0259821"; transcript_id "FBtr0336454"; exon_number "12"; gene_name "CG42402"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG42402-RD"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; exon_id "FBtr0336454-E12";
3R	FlyBase	three_prime_utr	4102832	4104326	.	+	.	gene_id "FBgn0259821"; transcript_id "FBtr0336454"; gene_name "CG42402"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG42402-RD"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	transcript	4077939	4104326	.	+	.	gene_id "FBgn0259821"; transcript_id "FBtr0339974"; gene_name "CG42402"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG42402-RE"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	exon	4102500	4104326	.	+	.	gene_id "FBgn0259821"; transcript_id "FBtr0339974"; exon_number "11"; gene_name "CG42402"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG42402-RE"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; exon_id "FBtr0336454-E12";
3R	FlyBase	three_prime_utr	4102832	4104326	.	+	.	gene_id "FBgn0259821"; transcript_id "FBtr0339974"; gene_name "CG42402"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG42402-RE"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	transcript	4084036	4104326	.	+	.	gene_id "FBgn0259821"; transcript_id "FBtr0301942"; gene_name "CG42402"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG42402-RC"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	exon	4102500	4104326	.	+	.	gene_id "FBgn0259821"; transcript_id "FBtr0301942"; exon_number "11"; gene_name "CG42402"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG42402-RC"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; exon_id "FBtr0336454-E12";
3R	FlyBase	three_prime_utr	4102832	4104326	.	+	.	gene_id "FBgn0259821"; transcript_id "FBtr0301942"; gene_name "CG42402"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG42402-RC"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	gene	4126442	4137882	.	+	.	gene_id "FBgn0027341"; gene_name "Gfat1"; gene_source "FlyBase"; gene_biotype "protein_coding";
3R	FlyBase	transcript	4126442	4137882	.	+	.	gene_id "FBgn0027341"; transcript_id "FBtr0302850"; gene_name "Gfat1"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gfat1-RN"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	transcript	4126442	4137882	.	+	.	gene_id "FBgn0027341"; transcript_id "FBtr0113694"; gene_name "Gfat1"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gfat1-RH"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	transcript	4130521	4137882	.	+	.	gene_id "FBgn0027341"; transcript_id "FBtr0302847"; gene_name "Gfat1"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gfat1-RK"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	exon	4133219	4135381	.	+	.	gene_id "FBgn0027341"; transcript_id "FBtr0302847"; exon_number "3"; gene_name "Gfat1"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gfat1-RK"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; exon_id "FBtr0302847-E3";
3R	FlyBase	five_prime_utr	4133219	4135114	.	+	.	gene_id "FBgn0027341"; transcript_id "FBtr0302847"; gene_name "Gfat1"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gfat1-RK"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	transcript	4130521	4137882	.	+	.	gene_id "FBgn0027341"; transcript_id "FBtr0113687"; gene_name "Gfat1"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gfat1-RA"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	transcript	4130521	4137882	.	+	.	gene_id "FBgn0027341"; transcript_id "FBtr0302849"; gene_name "Gfat1"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gfat1-RM"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	transcript	4130521	4137882	.	+	.	gene_id "FBgn0027341"; transcript_id "FBtr0302848"; gene_name "Gfat1"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gfat1-RL"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	transcript	4130521	4137882	.	+	.	gene_id "FBgn0027341"; transcript_id "FBtr0302846"; gene_name "Gfat1"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gfat1-RJ"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	transcript	4130521	4137882	.	+	.	gene_id "FBgn0027341"; transcript_id "FBtr0113692"; gene_name "Gfat1"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gfat1-RD"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	transcript	4130521	4137882	.	+	.	gene_id "FBgn0027341"; transcript_id "FBtr0113690"; gene_name "Gfat1"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gfat1-RF"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	gene	4174632	4186751	.	+	.	gene_id "FBgn0037213"; gene_name "CG12581"; gene_source "FlyBase"; gene_biotype "protein_coding";
3R	FlyBase	transcript	4174632	4186751	.	+	.	gene_id "FBgn0037213"; transcript_id "FBtr0078961"; gene_name "CG12581"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG12581-RB"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	exon	4174856	4176191	.	+	.	gene_id "FBgn0037213"; transcript_id "FBtr0078961"; exon_number "2"; gene_name "CG12581"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG12581-RB"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; exon_id "FBtr0078961-E2";
3R	FlyBase	exon	4183717	4186751	.	+	.	gene_id "FBgn0037213"; transcript_id "FBtr0078961"; exon_number "4"; gene_name "CG12581"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG12581-RB"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; exon_id "FBtr0078961-E4";
3R	FlyBase	three_prime_utr	4184050	4186751	.	+	.	gene_id "FBgn0037213"; transcript_id "FBtr0078961"; gene_name "CG12581"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG12581-RB"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	transcript	4174632	4184473	.	+	.	gene_id "FBgn0037213"; transcript_id "FBtr0078962"; gene_name "CG12581"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG12581-RA"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	exon	4174632	4176191	.	+	.	gene_id "FBgn0037213"; transcript_id "FBtr0078962"; exon_number "1"; gene_name "CG12581"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG12581-RA"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; exon_id "FBtr0078962-E1";
3R	FlyBase	gene	4186963	4196210	.	+	.	gene_id "FBgn0053294"; gene_name "CR33294"; gene_source "FlyBase"; gene_biotype "pseudogene";
3R	FlyBase	transcript	4186963	4196210	.	+	.	gene_id "FBgn0053294"; transcript_id "FBtr0308946"; gene_name "CR33294"; gene_source "FlyBase"; gene_biotype "pseudogene"; transcript_name "CR33294-RD"; transcript_source "FlyBase"; transcript_biotype "pseudogene";
3R	FlyBase	transcript	4191285	4196210	.	+	.	gene_id "FBgn0053294"; transcript_id "FBtr0308945"; gene_name "CR33294"; gene_source "FlyBase"; gene_biotype "pseudogene"; transcript_name "CR33294-RC"; transcript_source "FlyBase"; transcript_biotype "pseudogene";
3R	FlyBase	gene	4197206	4204572	.	+	.	gene_id "FBgn0037215"; gene_name "CG12582"; gene_source "FlyBase"; gene_biotype "protein_coding";
3R	FlyBase	transcript	4197206	4204572	.	+	.	gene_id "FBgn0037215"; transcript_id "FBtr0336703"; gene_name "CG12582"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG12582-RG"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	transcript	4197206	4204572	.	+	.	gene_id "FBgn0037215"; transcript_id "FBtr0336704"; gene_name "CG12582"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG12582-RH"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	transcript	4197206	4204572	.	+	.	gene_id "FBgn0037215"; transcript_id "FBtr0306022"; gene_name "CG12582"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG12582-RD"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	transcript	4197206	4204572	.	+	.	gene_id "FBgn0037215"; transcript_id "FBtr0078964"; gene_name "CG12582"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG12582-RA"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	transcript	4197308	4204565	.	+	.	gene_id "FBgn0037215"; transcript_id "FBtr0336702"; gene_name "CG12582"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "CG12582-RF"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	gene	4211783	4227518	.	+	.	gene_id "FBgn0037218"; gene_name "aux"; gene_source "FlyBase"; gene_biotype "protein_coding";
3R	FlyBase	transcript	4211783	4227518	.	+	.	gene_id "FBgn0037218"; transcript_id "FBtr0078965"; gene_name "aux"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "aux-RA"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	transcript	4220986	4227518	.	+	.	gene_id "FBgn0037218"; transcript_id "FBtr0336705"; gene_name "aux"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "aux-RC"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	transcript	4220986	4227518	.	+	.	gene_id "FBgn0037218"; transcript_id "FBtr0336706"; gene_name "aux"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "aux-RD"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	transcript	4220986	4227518	.	+	.	gene_id "FBgn0037218"; transcript_id "FBtr0078966"; gene_name "aux"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "aux-RB"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	gene	4233047	4235041	.	+	.	gene_id "FBgn0015331"; gene_name "abs"; gene_source "FlyBase"; gene_biotype "protein_coding";
3R	FlyBase	transcript	4233047	4235041	.	+	.	gene_id "FBgn0015331"; transcript_id "FBtr0078967"; gene_name "abs"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "abs-RA"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	exon	4233047	4235041	.	+	.	gene_id "FBgn0015331"; transcript_id "FBtr0078967"; exon_number "1"; gene_name "abs"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "abs-RA"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; exon_id "FBtr0078967-E1";
3R	FlyBase	CDS	4233129	4234985	.	+	0	gene_id "FBgn0015331"; transcript_id "FBtr0078967"; exon_number "1"; gene_name "abs"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "abs-RA"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; protein_id "FBpp0078606";
3R	FlyBase	gene	4235217	4241057	.	+	.	gene_id "FBgn0010225"; gene_name "Gel"; gene_source "FlyBase"; gene_biotype "protein_coding";
3R	FlyBase	transcript	4235217	4241057	.	+	.	gene_id "FBgn0010225"; transcript_id "FBtr0078973"; gene_name "Gel"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gel-RF"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	exon	4238819	4240524	.	+	.	gene_id "FBgn0010225"; transcript_id "FBtr0078973"; exon_number "6"; gene_name "Gel"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gel-RF"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; exon_id "FBtr0078973-E6";
3R	FlyBase	CDS	4238819	4240524	.	+	2	gene_id "FBgn0010225"; transcript_id "FBtr0078973"; exon_number "6"; gene_name "Gel"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gel-RF"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; protein_id "FBpp0078612";
3R	FlyBase	transcript	4235217	4241057	.	+	.	gene_id "FBgn0010225"; transcript_id "FBtr0336707"; gene_name "Gel"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gel-RL"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	exon	4238819	4240524	.	+	.	gene_id "FBgn0010225"; transcript_id "FBtr0336707"; exon_number "5"; gene_name "Gel"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gel-RL"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; exon_id "FBtr0078973-E6";
3R	FlyBase	CDS	4238819	4240524	.	+	2	gene_id "FBgn0010225"; transcript_id "FBtr0336707"; exon_number "5"; gene_name "Gel"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gel-RL"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; protein_id "FBpp0307688";
3R	FlyBase	transcript	4235217	4241057	.	+	.	gene_id "FBgn0010225"; transcript_id "FBtr0309256"; gene_name "Gel"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gel-RJ"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	exon	4238819	4240524	.	+	.	gene_id "FBgn0010225"; transcript_id "FBtr0309256"; exon_number "7"; gene_name "Gel"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gel-RJ"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; exon_id "FBtr0078973-E6";
3R	FlyBase	CDS	4238819	4240524	.	+	2	gene_id "FBgn0010225"; transcript_id "FBtr0309256"; exon_number "7"; gene_name "Gel"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gel-RJ"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; protein_id "FBpp0301195";
3R	FlyBase	transcript	4235217	4241057	.	+	.	gene_id "FBgn0010225"; transcript_id "FBtr0078969"; gene_name "Gel"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gel-RD"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	exon	4238819	4240524	.	+	.	gene_id "FBgn0010225"; transcript_id "FBtr0078969"; exon_number "8"; gene_name "Gel"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gel-RD"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; exon_id "FBtr0078973-E6";
3R	FlyBase	CDS	4238819	4240524	.	+	2	gene_id "FBgn0010225"; transcript_id "FBtr0078969"; exon_number "8"; gene_name "Gel"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gel-RD"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; protein_id "FBpp0078608";
3R	FlyBase	transcript	4235217	4241057	.	+	.	gene_id "FBgn0010225"; transcript_id "FBtr0078968"; gene_name "Gel"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gel-RB"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	exon	4238819	4240524	.	+	.	gene_id "FBgn0010225"; transcript_id "FBtr0078968"; exon_number "6"; gene_name "Gel"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gel-RB"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; exon_id "FBtr0078973-E6";
3R	FlyBase	CDS	4238819	4240524	.	+	2	gene_id "FBgn0010225"; transcript_id "FBtr0078968"; exon_number "6"; gene_name "Gel"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gel-RB"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; protein_id "FBpp0078607";
3R	FlyBase	transcript	4236788	4241057	.	+	.	gene_id "FBgn0010225"; transcript_id "FBtr0078971"; gene_name "Gel"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gel-RA"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	exon	4238819	4240524	.	+	.	gene_id "FBgn0010225"; transcript_id "FBtr0078971"; exon_number "5"; gene_name "Gel"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gel-RA"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; exon_id "FBtr0078973-E6";
3R	FlyBase	CDS	4238819	4240524	.	+	2	gene_id "FBgn0010225"; transcript_id "FBtr0078971"; exon_number "5"; gene_name "Gel"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gel-RA"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; protein_id "FBpp0078610";
3R	FlyBase	transcript	4236788	4241057	.	+	.	gene_id "FBgn0010225"; transcript_id "FBtr0309257"; gene_name "Gel"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gel-RK"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	exon	4238819	4240524	.	+	.	gene_id "FBgn0010225"; transcript_id "FBtr0309257"; exon_number "6"; gene_name "Gel"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gel-RK"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; exon_id "FBtr0078973-E6";
3R	FlyBase	CDS	4238819	4240524	.	+	2	gene_id "FBgn0010225"; transcript_id "FBtr0309257"; exon_number "6"; gene_name "Gel"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "Gel-RK"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; protein_id "FBpp0301196";
3R	FlyBase	gene	4243606	4245511	.	+	.	gene_id "FBgn0037223"; gene_name "TwdlU"; gene_source "FlyBase"; gene_biotype "pseudogene";
3R	FlyBase	transcript	4243606	4245511	.	+	.	gene_id "FBgn0037223"; transcript_id "FBtr0113190"; gene_name "TwdlU"; gene_source "FlyBase"; gene_biotype "pseudogene"; transcript_name "TwdlU-RC"; transcript_source "FlyBase"; transcript_biotype "pseudogene";
3R	FlyBase	gene	4247020	4248313	.	+	.	gene_id "FBgn0037224"; gene_name "TwdlF"; gene_source "FlyBase"; gene_biotype "protein_coding";
3R	FlyBase	transcript	4247020	4248313	.	+	.	gene_id "FBgn0037224"; transcript_id "FBtr0078975"; gene_name "TwdlF"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "TwdlF-RA"; transcript_source "FlyBase"; transcript_biotype "protein_coding";
3R	FlyBase	exon	4247144	4248313	.	+	.	gene_id "FBgn0037224"; transcript_id "FBtr0078975"; exon_number "2"; gene_name "TwdlF"; gene_source "FlyBase"; gene_biotype "protein_coding"; transcript_name "TwdlF-RA"; transcript_source "FlyBase"; transcript_biotype "protein_coding"; exon_id "FBtr0078975-E2";

awk 'NR>5' ~/data/BDGP6/BDGP6.Ensembl.85.gtf | awk '{out=""; for (i=9; i<=NF;++i) {out=out""$i"\t"}; print out}' | head -100
#first 100
gene_id	"FBgn0085804";	gene_name	"CR41571";	gene_source	"FlyBase";	gene_biotype	"pseudogene";	
gene_id	"FBgn0085804";	transcript_id	"FBtr0114258";	gene_name	"CR41571";	gene_source	"FlyBase";	gene_biotype	"pseudogene";	transcript_name	"CR41571-RA";	transcript_source	"FlyBase";	transcript_biotype	"pseudogene";	
gene_id	"FBgn0085804";	transcript_id	"FBtr0114258";	exon_number	"1";	gene_name	"CR41571";	gene_source	"FlyBase";	gene_biotype	"pseudogene";	transcript_name	"CR41571-RA";	transcript_source	"FlyBase";	transcript_biotype	"pseudogene";	exon_id	"FBtr0114258-E1";	
gene_id	"FBgn0267431";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"1";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346770-E1";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"1";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312365";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"1";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"2";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346770-E2";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"2";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312365";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"3";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346770-E3";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"3";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312365";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"4";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346770-E4";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"4";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312365";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"5";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346770-E5";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"5";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312365";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"6";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346770-E6";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"6";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312365";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"7";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346770-E7";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"7";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312365";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"8";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346770-E8";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"8";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312365";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"9";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346770-E9";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"9";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312365";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"10";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346770-E10";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"10";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312365";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"11";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346770-E11";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"11";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312365";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"12";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346770-E12";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"12";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312365";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"13";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346770-E13";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"13";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312365";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"14";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346770-E14";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"14";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312365";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"15";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346770-E15";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"15";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312365";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"16";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346770-E16";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"16";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312365";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"17";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346770-E17";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"17";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312365";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"18";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346770-E18";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"18";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312365";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"19";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346770-E19";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"19";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312365";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"20";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346770-E20";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"20";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312365";	
gene_id	"FBgn0267431";	transcript_id	"FBtr0346770";	exon_number	"20";	gene_name	"CG45784";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45784-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	
gene_id	"FBgn0039987";	gene_name	"CR12798";	gene_source	"FlyBase";	gene_biotype	"pseudogene";	
gene_id	"FBgn0039987";	transcript_id	"FBtr0302440";	gene_name	"CR12798";	gene_source	"FlyBase";	gene_biotype	"pseudogene";	transcript_name	"CR12798-RB";	transcript_source	"FlyBase";	transcript_biotype	"pseudogene";	
gene_id	"FBgn0039987";	transcript_id	"FBtr0302440";	exon_number	"1";	gene_name	"CR12798";	gene_source	"FlyBase";	gene_biotype	"pseudogene";	transcript_name	"CR12798-RB";	transcript_source	"FlyBase";	transcript_biotype	"pseudogene";	exon_id	"FBtr0302440-E1";	
gene_id	"FBgn0058182";	gene_name	"CR40182";	gene_source	"FlyBase";	gene_biotype	"pseudogene";	
gene_id	"FBgn0058182";	transcript_id	"FBtr0302347";	gene_name	"CR40182";	gene_source	"FlyBase";	gene_biotype	"pseudogene";	transcript_name	"CR40182-RB";	transcript_source	"FlyBase";	transcript_biotype	"pseudogene";	
gene_id	"FBgn0058182";	transcript_id	"FBtr0302347";	exon_number	"1";	gene_name	"CR40182";	gene_source	"FlyBase";	gene_biotype	"pseudogene";	transcript_name	"CR40182-RB";	transcript_source	"FlyBase";	transcript_biotype	"pseudogene";	exon_id	"FBtr0302347-E1";	
gene_id	"FBgn0267430";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"1";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346769-E1";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"1";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312364";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"1";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"2";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346769-E2";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"2";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312364";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"3";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346769-E3";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"3";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312364";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"4";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346769-E4";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"4";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312364";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"5";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346769-E5";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"5";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312364";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"6";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346769-E6";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"6";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312364";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"7";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346769-E7";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"7";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312364";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"8";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346769-E8";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"8";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312364";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"9";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346769-E9";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"9";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312364";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"10";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346769-E10";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"10";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312364";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"11";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346769-E11";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"11";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312364";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"12";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346769-E12";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"12";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312364";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"13";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346769-E13";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"13";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312364";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"14";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346769-E14";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"14";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312364";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"15";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346769-E15";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"15";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312364";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"16";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346769-E16";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"16";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312364";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"17";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346769-E17";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"17";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312364";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"18";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346769-E18";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"18";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312364";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"19";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	exon_id	"FBtr0346769-E19";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"19";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	protein_id	"FBpp0312364";	
gene_id	"FBgn0267430";	transcript_id	"FBtr0346769";	exon_number	"19";	gene_name	"CG45783";	gene_source	"FlyBase";	gene_biotype	"protein_coding";	transcript_name	"CG45783-RA";	transcript_source	"FlyBase";	transcript_biotype	"protein_coding";	
gene_id	"FBgn0266747";	gene_name	"CR45220";	gene_source	"FlyBase";	gene_biotype	"lincRNA";	
gene_id	"FBgn0266747";	transcript_id	"FBtr0345282";	gene_name	"CR45220";	gene_source	"FlyBase";	gene_biotype	"lincRNA";	transcript_name	"CR45220-RB";	transcript_source	"FlyBase";	transcript_biotype	"lincRNA";	
gene_id	"FBgn0266747";	transcript_id	"FBtr0345282";	exon_number	"1";	gene_name	"CR45220";	gene_source	"FlyBase";	gene_biotype	"lincRNA";	transcript_name	"CR45220-RB";	transcript_source	"FlyBase";	transcript_biotype	"lincRNA";	exon_id	"FBtr0345282-E1";	
gene_id	"FBgn0266747";	transcript_id	"FBtr0345282";	exon_number	"2";	gene_name	"CR45220";	gene_source	"FlyBase";	gene_biotype	"lincRNA";	transcript_name	"CR45220-RB";	transcript_source	"FlyBase";	transcript_biotype	"lincRNA";	exon_id	"FBtr0345282-E2";	
gene_id	"FBgn0266747";	transcript_id	"FBtr0345281";	gene_name	"CR45220";	gene_source	"FlyBase";	gene_biotype	"lincRNA";	transcript_name	"CR45220-RA";	transcript_source	"FlyBase";	transcript_biotype	"lincRNA";



