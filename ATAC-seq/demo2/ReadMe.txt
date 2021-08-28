For scATAC-seq from plate methods
v0.1
v0.2 anno, pie plot
v0.3 use bowtie2
v0.4 add theads for map QC
v0.5 change to mouse 38

###########
step 1: mapping one by one.
step 2: merge bam, call peak, annotaion.

ref: https://yiweiniu.github.io/blog/2019/03/ATAC-seq-data-analysis-from-FASTQ-to-peaks/


Warning: double check the ref files(.fa, .gtf, .bed) to match human or mouse, and chr10 and 10.



0. Softwares:
$ bowtie2 --version
/home/wangjl/soft/bowtie2-2.3.5.1-linux-x86_64/bowtie2-align-s version 2.3.5.1

$ bwa
Program: bwa (alignment via Burrows-Wheeler transformation)
Version: 0.7.17-r1188




1. snakemake: main.sf
(1)modify: 
- human or mouse?
- 19 or 38?
- in rule main.sf, rules/06, 07

(2) fastq
"raw/{sample}_R1.fastq.gz"
"raw/{sample}_R2.fastq.gz"

(3) from fq to macs2 call peak.
$ snakemake -s /data/wangjl/soft/snakemakeWorkflow/ATAC-seq/demo2/main.sf -j 4 -p

As reads are so few, we should merge the bam files.




2. merge bam files and call peaks.
$ cd /data/wangjl/ATAC/hair/data_P1
(optional) merge bam [Optional, as this step is now included in mainBulk.sf ]
$ ls map_clean/*final.bam |xargs -i samtools view {} | wc
51916420 886379942 11027899754
## 51 million reads.


(1) Bam_QC:
- merge bam
- TSS heatmap, 
- insertion length distribution

##(jump, as)the following block has been included in bam_QC.sf
$ mkdir merged
$ samtools merge merged/total.bam `ls map_clean/*final.bam |xargs`
$ samtools view  merged/total.bam |wc
51916420 886379942 11027899754
## need index first:
$ samtools index  merged/total.bam


use -s bam_QC.sf
$ snakemake -s /data/wangjl/soft/snakemakeWorkflow/ATAC-seq/demo2/bam_QC.sf -j 5 -p


(2) call peak and find motif 
- peak annotation, get_8th_col, and pie plot
- getMatrix;

use -s mainBulk.sf 
$ snakemake -s /data/wangjl/soft/snakemakeWorkflow/ATAC-seq/demo2/mainBulk.sf -j 5 -p

(3) Goto Seurat R package to cluster cells.

