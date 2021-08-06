This workflow suits for PE ATAC-seq
default: human hg38
v0.1
v0.2


1. Just enter your working directory, create a new text file named config.yaml
set 
  - samples: example names, for SRR7629163_1.fastq.gz, SRR7629163_2.fastq.gz, you only need to set SRR7629163 
  - workdir (no / at the end)
  - and Snk_RootDir:  the snakemakefile script root dir (no / at the end)


2.Then you have to put your raw fastq.gz data in 
raw/ under the work dir you set.


3. modify the rules/01 02 to satisfy your input filenames.


4. First dry run from your working directory
$ snakemake -s main.sf -np


then run:
$ snakemake -s main.sf -j 8

this takes a long time.
E.g.: 6 samples 6 hours.




5. (optional) this has been included in the main.sf
report:  Second dry run
$ snakemake -s getReport.sf -np

then run:
$ snakemake -s getReport.sf -j 5



================
How to make a config.yaml file?


$ path1="/home/wangjl/data/ATAC/hair/raw/origin/"
$ seq 1 96 | while read i; do 
id="cgm-"${i};
echo $id; 
ln -s ${path1}/${id}_R1.fastq.gz raw/${id}_1.fastq.gz;
ln -s ${path1}/${id}_R2.fastq.gz raw/${id}_2.fastq.gz;
echo $id >>raw/cid.txt
done;


$ zcat raw/cgm-2_1.fastq.gz | head
@A00582:646:H7CJTDSX2:4:1101:27534:1141 1:N:0:CTAAACGG+AGAGGATA
CTTATACACATCTCCGAGCCCACGAGACCTAAACGGATCTCGGATGCCGTCTTGGGCGTGGAAAGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
+
FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF,:F,,:,,,F,,,,,,F,,,F,,,,,,:::FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF


$ cp raw/cid.txt config.yaml
$ sed -i "s/^/ - /" config.yaml

$ vim config.yaml ###add three lines on top
workdir: /home/wangjl/data/ATAC/hair
Snk_RootDir: /home/wangjl/soft/snakemakeWorkflow/ATAC-seq/demo1
samples: 

$ vim test.sf 
configfile:"config.yaml"
SI=config["samples"]
print(SI[1:10])

$ snakemake -s test.sf -j 1
['cgm-2', 'cgm-3', 'cgm-4', 'cgm-5', 'cgm-6', 'cgm-7', 'cgm-8', 'cgm-9', 'cgm-10']




## dry run:
$ snakemake -s /home/wangjl/soft/snakemakeWorkflow/ATAC-seq/demo1/main.sf -np

$ snakemake -s /home/wangjl/soft/snakemakeWorkflow/ATAC-seq/demo1/main.sf -j 8



================================
Maybe some modification before run:
1. filter bam file by MAPQ, in rules/04Bam_filter.sf




