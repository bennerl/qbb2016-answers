#!/usr/bin/env python

import sys, fasta, itertools
import numpy as np
import matplotlib.pyplot as plt
import statsmodels.api as sm
from scipy import stats
dna_file = open("rem_seq.txt")
pro_file = open("aligned_seq.txt")
dna_seq = []
pro_seq = []
final_dna_seq = []


for ident, sequence in fasta.FASTAReader(pro_file):
    pro_seq.append(sequence)
for ident, sequence in fasta.FASTAReader(dna_file):
    dna_seq.append(sequence)

for pro, dna in itertools.izip(pro_seq, dna_seq):
    temp_dna_seq = []
    temp_pos = 0
    for p in pro:
        if p == "-":
            temp_dna_seq.append("---")
        else:
            temp_dna = dna[temp_pos: temp_pos + 3]
            temp_dna_seq.append(temp_dna)
            temp_pos += 3
    final_dna_seq.append("".join(temp_dna_seq))
dS={}
dN={}
codontable = {
'ATA':'I', 'ATC':'I', 'ATT':'I', 'ATG':'M',
'ACA':'T', 'ACC':'T', 'ACG':'T', 'ACT':'T',
'AAC':'N', 'AAT':'N', 'AAA':'K', 'AAG':'K',
'AGC':'S', 'AGT':'S', 'AGA':'R', 'AGG':'R',
'CTA':'L', 'CTC':'L', 'CTG':'L', 'CTT':'L',
'CCA':'P', 'CCC':'P', 'CCG':'P', 'CCT':'P',
'CAC':'H', 'CAT':'H', 'CAA':'Q', 'CAG':'Q',
'CGA':'R', 'CGC':'R', 'CGG':'R', 'CGT':'R',
'GTA':'V', 'GTC':'V', 'GTG':'V', 'GTT':'V',
'GCA':'A', 'GCC':'A', 'GCG':'A', 'GCT':'A',
'GAC':'D', 'GAT':'D', 'GAA':'E', 'GAG':'E',
'GGA':'G', 'GGC':'G', 'GGG':'G', 'GGT':'G',
'TCA':'S', 'TCC':'S', 'TCG':'S', 'TCT':'S',
'TTC':'F', 'TTT':'F', 'TTA':'L', 'TTG':'L',
'TAC':'Y', 'TAT':'Y', 'TAA':'_', 'TAG':'_',
'TGC':'C', 'TGT':'C', 'TGA':'_', 'TGG':'W',
}

for i, seq in enumerate(final_dna_seq):
    if i == 0:
        orig_dna_seq = seq
        break
for i in range(0, len(orig_dna_seq)):
    num = i + 1
    dN[num] = 0
    dS[num] = 0
for i, seq in enumerate(final_dna_seq):
    if i == 0:
        continue
    nucleotide_num = 1
    for pos in range(0, len(seq) - 3, 3 ):
        seq_codon = seq[ pos: pos + 3 ]
        orig_codon = orig_dna_seq[ pos: pos + 3 ]
        for nucleo in seq_codon:
            if nucleo == "R" or nucleo == "Y" or nucleo == "W" or nucleo == "K" or nucleo == "M" or nucleo == "N" or nucleo == "S":
                seq_codon = list(seq_codon)
                pos_uns_nuc = seq_codon.index(nucleo)
                seq_codon[pos_uns_nuc] = orig_codon[pos_uns_nuc]
                seq_codon = "".join(seq_codon)
        if orig_codon == "---":
            orig_codon = seq_codon
        if seq_codon != "---":
            codon_pos = 0
            for s, o in zip(seq_codon, orig_codon):
                if s != o:
                    if codon_pos == 0:
                        if codontable[seq_codon] != codontable[orig_codon]:
                            temp_seq_codon = s + orig_codon[1] + orig_codon[2]
                            if codontable[temp_seq_codon] != codontable[orig_codon]:
                                dN[nucleotide_num] += 1
                                codon_pos += 1
                                nucleotide_num += 1
                            else:
                                dS[nucleotide_num] += 1
                                codon_pos += 1
                                nucleotide_num += 1
                        else:
                            dS[nucleotide_num] += 1
                            codon_pos += 1
                            nucleotide_num += 1
                    elif codon_pos == 1:
                        if codontable[seq_codon] != codontable[orig_codon]:
                            temp_seq_codon = orig_codon[0] + s + orig_codon[2]
                            if codontable[temp_seq_codon] != codontable[orig_codon]:
                                dN[nucleotide_num] += 1
                                codon_pos += 1
                                nucleotide_num += 1
                            else:
                                dS[nucleotide_num] += 1
                                codon_pos += 1
                                nucleotide_num += 1
                        else:
                            dS[nucleotide_num] += 1
                            codon_pos += 1
                            nucleotide_num += 1
                    elif codon_pos == 2:
                        if codontable[seq_codon] != codontable[orig_codon]:
                            temp_seq_codon = orig_codon[0] + orig_codon[1] + s
                            if codontable[temp_seq_codon] != codontable[orig_codon]:
                                dN[nucleotide_num] += 1
                                codon_pos += 1
                                nucleotide_num += 1
                            else:
                                dS[nucleotide_num] += 1
                                codon_pos += 1
                                nucleotide_num += 1
                        else:
                            dS[nucleotide_num] += 1
                            codon_pos += 1
                            nucleotide_num += 1
                else:
                    nucleotide_num += 1
        else:
            nucleotide_num += 3
dN_dS = []
dN_list = []
dS_list = []
#for key in dN:
    #dN_dS.append((np.log(dN[key] + 1)) / (np.log(dS[key] + 1)))
sum_dN = 0    
sum_dS = 0
dN_over_dS = []
dN_minus_dS = []
for key in dN:
    dN_list.append(dN[key])
    dS_list.append(dS[key])
    sum_dN += dN[key]
    sum_dS += dS[key]
    dN_over_dS.append(float((dN[key] + 1) / (dS[key] + 1)))
    dN_minus_dS.append(dN[key] - dS[key])
#print sm.ztest_ind(dN, dS)

# print dN_minus_dS
z_dNoverdS = stats.zscore(dN_over_dS)
z_dNminusdS = stats.zscore(dN_minus_dS)

# for i, z in enumerate(z_dNminusdS):
#     if z >= 3:
#         print z, i+1

# print stats.zscore(dN_list)
# print stats.zscore(dS_list)
#
# plt.figure()
# plt.hist(dN_minus_dS, bins=100)
# plt.savefig("hist.png")
# plt.close()
#
# plt.figure()
# plt.plot(dN_minus_dS)
# plt.savefig("plot_minus.png")
# plt.close()
#
# plt.figure()
# plt.plot(dN_dS)
# plt.savefig("plot.png")
# plt.close()

plt.figure()
for i, z in enumerate(z_dNminusdS):
    if z >= 3:
        plt.scatter(i, z, color='red')
    else:
        plt.scatter(i, z, color='blue')
plt.ylabel("dN minus dS")
plt.title("synonomous and nonsynonomous mutations")
plt.xlabel("nucleotide position")
plt.savefig("plot.png")
plt.close()