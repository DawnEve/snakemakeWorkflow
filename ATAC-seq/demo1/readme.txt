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


