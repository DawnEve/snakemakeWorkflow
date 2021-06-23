myArgs<-commandArgs(TRUE)

infile=myArgs[1]
outfile=myArgs[2]
params.key=myArgs[3]

setwd(myArgs[4])

library("ATACseqQC");
pdf(outfile, width=5, height=5);
fragSizeDist(infile, params.key)
dev.off();

outfile2=paste0(substring(outfile, 1, nchar(outfile)-3), "png")
print("===================>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
print(outfile2)

png(outfile2, width=1500, height=1500, res=300);
fragSizeDist(infile, params.key)
dev.off();
