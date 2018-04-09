cLoops -f ../2.1.bedpesHiCPro/cohesin_GM12878_bio1_tech1.bedpe.gz -o cohesin_bio1_tech1 -p 10 -minPts 15,20 -eps 5000,7500,10000 -j 1 -hic 1
cLoops -f ../2.1.bedpesHiCPro/cohesin_GM12878_bio1_tech2.bedpe.gz -o cohesin_bio1_tech2 -p 10 -minPts 10,15 -eps 5000,7500,10000 -j 1 -hic 1
cut -f1,2,3,4,5,6 cohesin_bio1_tech1_loops_juicebox.txt > tech1_loops.bedpe 
cut -f1,2,3,4,5,6 cohesin_bio1_tech2_loops_juicebox.txt > tech2_loops.bedpe 
bedtools pairtopair -a tech1_loops.bedpe -b tech2_loops.bedpe -type both > overlap.bedpe
