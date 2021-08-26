1.主版本3大步骤: main.sf
	压缩前的 md5sum m1
	压缩后的 md5sum m2
	压缩后再解压的 md5sum m3
	比较m3是否等于m1的值
就按照单文件写，如果是双端，可以当不同的文件名。

起点是输入 raw/ 下的文件名
$ cat config.yaml
samples:
 - a1.fastq
 - a2.fastq
 - b1.fastq
 - b2.fastq

$ snakemake -s /home/wangjl/data/soft/snakemakeWorkflow/shell/demo1/main.sf -j 4 -p
终点是输出 
  gz/ 压缩后的文件
  md5/ 3个md5汇总表，
    压缩前 origin，
    压缩后 gz，
    解压后 unzip。



2. 精简版本：simple.sf 
仅仅计算文件压缩前/ 解压后的md5sum值。

$ snakemake -s /home/wangjl/data/soft/snakemakeWorkflow/shell/demo1/simple.sf -j 4 -p

输出原始文件的md5，和压缩文件解压后的md5。
然后手动比较第一列的md5是否一致
$ awk '{print $1}' md5/origin.md5 | md5sum
$ awk '{print $1}' md5/unzip.md5 | md5sum


