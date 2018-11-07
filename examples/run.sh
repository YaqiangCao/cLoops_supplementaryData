#CTCF ChIA-PET
cLoops -f GSM1872886_GM12878_CTCF_ChIA-PET_chr21_hg38.bedpe.gz -o chiapet -w -j -s -m 1
jd2juice -d chiapet -o CTCF_chr21 -org hg38
jd2washU -d chiapet -o CTCF_chr21

#cohesin HiChIP 
cLoops -f GSE80820_GM12878_cohesin_HiChIP_chr21_hg38_bio1.bedpe.gz,GSE80820_GM12878_cohesin_HiChIP_chr21_hg38_bio2.bedpe.gz -o hichip -m 4 -j -s -w 
jd2juice -d hichip -o cohesin_chr21 -org hg38
jd2washU -d hichip -o cohesin_chr21

#Hi-C
cLoops -f GSM1551552_GM12878_HiC_chr21_hg38.bedpe.gz -o hic -w -j -s -m 3
jd2juice -d hic -o hic_chr21 -org hg38
jd2washU -d hic -o hic_chr21

#fingerprint for quality control
jd2fingerprint -d chiapet,hichip,hic -plot 1 -o compare -bs 2000

#2018-05-17 added, call stripes
#run cLoops to call loops, with option -s to save the middle files
cLoops -f GSE101498_K562_HiChIP_H3K27ac_rep1.bedpe.gz,GSE101498_K562_HiChIP_H3K27ac_rep2.bedpe.gz,GSE101498_K562_HiChIP_H3K27ac_rep3.bedpe.gz -o K562_HiChIP_H3K27ac_chr21 -minPts 20,30 -eps 2500,5000,7500,10000 -hic -s -j -c chr21
#call stripes 
callStripes -d K562_HiChIP_H3K27ac_chr21 -o K562_HiChIP_H3K27ac_chr21 -c chr21 -j
#for visualization in juicebox
jd2juice -d K562_HiChIP_H3K27ac_chr21/ -o K562_HiChIP_H3K27ac_chr21 -org hg38

#2018-11-07 added, call loops for Trac-looping data
cLoops -f GSM2326178_CD4_Resting_Trac-looping_rep1-tech1_chr21_hg19.bedpe.gz,GSM2326179_CD4_Resting_Trac-looping_rep2_chr21_hg19.bedpe.gz,GSM2326180_CD4_Resting_Trac-looping_rep1-tech2_chr21_hg19.bedpe.gz,GSM2782295_CD4_Resting_Trac-looping_rep3_chr21_hg19.bedpe.gz,GSM2782296_CD4_Resting_Trac-looping_rep4_chr21_hg19.bedpe.gz -o Trac-looping_chr21 -eps 500,1000,2000,5000 -minPts 5 -p 5 -w -j -cut 2000 -s -c chr21 -max_cut
#for visualization in washU
jd2washU -d Trac-looping_chr21 -o Trac-looping_chr21 

