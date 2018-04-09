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
