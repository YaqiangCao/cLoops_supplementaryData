chroms="chr1,chr2,chr3,chr4,chr5,chr6,chr7,chr8,chr9,chr10,chr11,chr12,chr13,chr14,chr15,chr16,chr17,chr18,chr19,chr20,chr21,chr22,chrX,chrY,chrM"
cLoops -f cohesin_GM.bedpe.gz -o cohesin_GM -c $chroms -j 1 -eps 2500,5000,7500,10000 -minPts 20,30 -hic 1 -p 4
