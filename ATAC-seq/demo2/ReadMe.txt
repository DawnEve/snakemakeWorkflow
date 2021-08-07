For scATAC-seq from plate methods
v0.1
v0.2 anno, pie plot

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
peak annotation, get_8th_col, and pie plot

use -s mainBulk.sf 
$ snakemake -s /data/wangjl/soft/snakemakeWorkflow/ATAC-seq/demo2/mainBulk.sf -j 5 -p





