input=snakemake@input[[1]]
input2=snakemake@input[[2]]
output=snakemake@output[[1]]

dt=read.table(input, header = F)
#dim(dt);dt[1:4,1:8]
rownames(dt)=dt$V4

dt2=dt[, -c(1:6)]
colnames(dt2)= readLines(input2);
# dt2[1:4,1:8]; dim(dt2)
write.table(dt2, output)

