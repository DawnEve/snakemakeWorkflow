This workflow suit for PE ATAC-seq

1. Just modify config.yaml
set example names and workdir

2.Then you have to put your raw data in 
tmp/ under the work dir you set.

3. modify the rules/01 02 to satisfy your input file format.


4. First dry run 
$ snakemake -s main.sf -np

then run:
$ snakemake -s main.sf -j 5


5. Second dry run
$ snakemake -s getReport.sf -np

then run:
$ snakemake -s getReport.sf -j 5


