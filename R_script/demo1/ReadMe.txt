How to run a heavy task with multiple CPU cores?
Keywords: multi-threads, parallel computing;

v0.1 run in shell
v0.2 add how to run in R

###################
1. Task: 
step1: add 1 for each cell id, by multi-threads, in batches.
step2: combine to one result file (total.txt), sum to get the final results (stat.txt)


2. File structure:
├── cid.txt
├── main.sf                                      
├── scripts
│   ├── stat.R
│   └── worker.R


3. software

$ python3 -V
Python 3.6.9

$ snakemake --version
6.4.1

$ R --version
R version 3.6.3 (2020-02-29) -- "Holding the Windsock"



4.Run:
$ snakemake -s main.sf -j 4 -p



5. Result files:
├── worker
│   ├── result_1_30.txt
│   ├── result_31_60.txt
│   ├── result_61_90.txt
│   ├── result_91_100.txt
│   ├── stat.txt
│   └── total.txt




#######################
How to run parallel in R without interupting user to switch between R and shell?

Set any directory you like as working directory. 
Then prepare input file, and trigger parallel snakemake scripts in R.

$ seq 1 100 > cid.txt

$ R
snakePath="/home/wangjl/soft/snakemakeWorkflow/R_script/demo1/"
threads=4;
system(command = paste0("snakemake -s ",snakePath,"main.sf -p -j ", threads) , wait = T);
# here will be many output text like you run snakemake in shell, wait until task ends.

a=readLines("worker/stat.txt")
print(a) #[1] "5150"

