
rm nora*
rm out*
hifive 5c-complete express -C Nora_ESC_male_E14.counts -P nora  Nora_Primers.bed

hifive 5c-heatmap nora.fcp out.frag.heat -i out.frag.png -b 0 -d fragment
hifive 5c-heatmap nora.fcp out.enr.heat -i out.enr.png -b 0 -d enrichment



