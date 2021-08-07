input=snakemake@input[[1]]
output=snakemake@output[[1]]

d1=readLines(input)
d2=sub(" ", '', d1)
d3=data.frame(table(d2))
colnames(d3)=c("location", "Freq")
d3=d3[order(-d3$Freq),]

pdf(output, width=4, height=4)
par(mar=c(3,2,2,6))
pie(d3$Freq, labels=paste0(d3$location, '(', d3$Freq, ')' ) )
dev.off()
