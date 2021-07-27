input=snakemake@input[[1]]
output=snakemake@output[[1]]

df=read.table(input)
writeLines( as.character( sum(df$V3) ), output)

