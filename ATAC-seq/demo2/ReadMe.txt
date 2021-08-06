For scATAC-seq from plate methods
v0.1


step 1: mapping one by one.
step 2: merge bam, call peak, annotaion.



1. snakemake: main.sf
from fq to macs2 call peak.

As reads are so few, we should merge the bam files.


2. merge bam files and call peaks.
$ cd /data/wangjl/ATAC/hair/data_P1

(1) merge bam
$ ls map_clean/*final.bam |xargs -i samtools view {} | wc
51916420 886379942 11027899754
## 51 million reads.

$ mkdir merged
$ samtools merge merged/total.bam `ls map_clean/*final.bam |xargs`
$ samtools view  merged/total.bam |wc
51916420 886379942 11027899754


(2) Bam_QC: TSS heatmap, insertion length distribution
need index first:$ samtools index  merged/total.bam

use -s bam_QC.sf
$ snakemake -s /data/wangjl/soft/snakemakeWorkflow/ATAC-seq/demo2/bam_QC.sf -j 5 -p


(3) call peak and find motif 
use -s mainBulk.sf 
$ snakemake -s /data/wangjl/soft/snakemakeWorkflow/ATAC-seq/demo2/mainBulk.sf -j 5 -p

(4) peak annotation and pie plot
$ annotatePeaks.pl macs2_result/total_peaks.narrowPeak hg38 >anno/total_peakAnn.xls 

the 8th column:
$ cat anno/total_peakAnn.xls | awk -F "\t" '{print $8}' | awk -F"(" '{print $1}' | sed  -e 's/[ ]*$//g' -e "1d" > anno/anno.col8-2.txt 

plot in R:
$ R 
d1=readLines("anno/anno.col8-2.txt")
d2=sub(" ", '', d1)
d3=data.frame(table(d2))
colnames(d3)=c("location", "Freq")
d3=d3[order(-d3$Freq),]

pdf("anno/pie.pdf", width=4, height=4)
par(mar=c(3,2,2,6))
pie(d3$Freq, labels=paste0(d3$location, '(', d3$Freq, ')' ) )
dev.off()



