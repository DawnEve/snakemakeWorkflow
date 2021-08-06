## 同时生成pdf和png
# myArgs<-commandArgs(TRUE)
infile=snakemake@input[[1]]
outfile=snakemake@output[[1]]
params.key=snakemake@params[["key"]]

log <- file(snakemake@log[[1]], open="wt")
sink(log)

library("ATACseqQC");
pdf(outfile, width=5, height=5);
fragSizeDist(infile, params.key)
dev.off();

outfile2=paste0(substring(outfile, 1, nchar(outfile)-3), "png")
png(outfile2, width=1500, height=1500, res=300);
fragSizeDist(infile, params.key)
dev.off();

