rm -r velvet_reads_low/
rm -r spades_reads_low/
rm -r spades_reads_high
rm -r velvet_reads_high

velveth ~/qbb2016-answers/week2/velvet_reads_low 31 -shortPaired -fastq -separate reads_low_1.fastq reads_low_2.fastq
velvetg ~/qbb2016-answers/week2/velvet_reads_low
spades.py -o ~/qbb2016-answers/week2/spades_reads_low --only-assembler -1 reads_low_1.fastq -2 reads_low_2.fastq

velveth ~/qbb2016-answers/week2/velvet_reads_high 31 -shortPaired -fastq -separate reads_1.fastq reads_2.fastq
velvetg ~/qbb2016-answers/week2/velvet_reads_high
spades.py -o ~/qbb2016-answers/week2/spades_reads_high --only-assembler -1 reads_1.fastq -2 reads_2.fastq

./script.py > output.txt

lastz reference.fasta[unmask] velvet_reads_low/contigs.fa --chain --rdotplot=velvet_plot

lastz reference.fasta[unmask] spades_reads_low/contigs.fasta --chain --rdotplot=spades_plot

lastz reference.fasta[unmask] velvet_reads_high/contigs.fa --chain --rdotplot=velvet_plot_high

lastz reference.fasta[unmask] spades_reads_high/contigs.fasta --chain --rdotplot=spades_plot_high


quast -R reference.fasta -o ~/qbb2016-answers/week2/quast_output contigs/*fasta


