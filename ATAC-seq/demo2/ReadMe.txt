For scATAC-seq from plate methods
v0.1
v0.2 anno, pie plot
v0.3 use bowtie2


step 1: mapping one by one.
step 2: merge bam, call peak, annotaion.

ref: https://yiweiniu.github.io/blog/2019/03/ATAC-seq-data-analysis-from-FASTQ-to-peaks/


0. Softwares:
$ bowtie2 --version
/home/wangjl/soft/bowtie2-2.3.5.1-linux-x86_64/bowtie2-align-s version 2.3.5.1





1. snakemake: main.sf
from fq to macs2 call peak.
$ snakemake -s /data/wangjl/soft/snakemakeWorkflow/ATAC-seq/demo2/main.sf -j 4 -p


As reads are so few, we should merge the bam files.






2. merge bam files and call peaks.
$ cd /data/wangjl/ATAC/hair/data_P1
(optional) merge bam [Optional, as this step is now included in mainBulk.sf ]
$ ls map_clean/*final.bam |xargs -i samtools view {} | wc
51916420 886379942 11027899754
## 51 million reads.

$ mkdir merged
$ samtools merge merged/total.bam `ls map_clean/*final.bam |xargs`
$ samtools view  merged/total.bam |wc
51916420 886379942 11027899754


(1) Bam_QC: TSS heatmap, insertion length distribution
need index first:$ samtools index  merged/total.bam

use -s bam_QC.sf
$ snakemake -s /data/wangjl/soft/snakemakeWorkflow/ATAC-seq/demo2/bam_QC.sf -j 5 -p


(2) call peak and find motif 
peak annotation, get_8th_col, and pie plot
getMatrix;

use -s mainBulk.sf 
$ snakemake -s /data/wangjl/soft/snakemakeWorkflow/ATAC-seq/demo2/mainBulk.sf -j 5 -p

(3) Goto Seurat R package to cluster cells.
