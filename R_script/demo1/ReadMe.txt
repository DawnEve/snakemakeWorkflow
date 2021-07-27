Task: 
step1: add 1 for each cell id, by multi-threads, in batches.
step2: combine to one result file (total.txt), sum to get the final results (stat.txt)


file structure:
├── cid.txt
├── main.sf                                      
├── scripts
│   ├── stat.R
│   └── worker.R


result files:
├── worker
│   ├── result_1_30.txt
│   ├── result_31_60.txt
│   ├── result_61_90.txt
│   ├── result_91_100.txt
│   ├── stat.txt
│   └── total.txt


run:
$ snakemake -s main.sf -j 4 -p


