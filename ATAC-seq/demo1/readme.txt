This workflow suits for PE ATAC-seq
v0.1

1. Just modify config.yaml
set 
  - example names 
  - workdir (no / at the end)
  - and this snakemakefile script root dir (no / at the end)


2.Then you have to put your raw fastq.gz data in 
raw/ under the work dir you set.


3. modify the rules/01 02 to satisfy your input filenames.


4. First dry run 
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


