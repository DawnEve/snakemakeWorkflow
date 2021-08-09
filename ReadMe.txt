snakemake workflows
ref:https://github.com/snakemake-workflows




1. project list

ATAC-seq/ demo1: for replicate samples; 
ATAC-seq/ demo2: for plate method, 1 by 1 map, then merge.
	change from BWA to bowtie2;



R_script/ demo1: how to run parallel using snakemake in R environment, 
		and wait for a file to generate.




2. How to run

(1) -n 模拟运行: 检查语法错误
$ snakemake -np -s /data/wangjl/soft/snakemakeWorkflow/R_script/demo1/main.sf -j 4

-p 打印正在运行的命令。
-j 4 使用线程数

(2) 画流程图: 总体是否符合逻辑
步骤流程图
$ snakemake -f -s s1.sf --rulegraph 2> /dev/null | dot -T pdf > workflow.pdf

样本流程图
$ snakemake --dag -s s1.sf | dot -Tpdf > dag.pdf 
加 -forceall 则强制全部重新运行一次。

(3) 实际运行命令
$ snakemake -s /data/wangjl/soft/snakemakeWorkflow/R_script/demo1/main.sf -j 4


