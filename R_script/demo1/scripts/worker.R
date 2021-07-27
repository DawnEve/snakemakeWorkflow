#version2 for snakemake
input=snakemake@input[[1]];
output=snakemake@output[[1]];

# get parameters
#myArgs<-commandArgs(TRUE)
myArgs1=strsplit(output, "_")[[1]]

id1=as.numeric(myArgs1[2])
id2=as.numeric( strsplit(myArgs1[3], "\\.")[[1]][1] )
cat("start working, from-to: ", id1, id2, "\n");

# get cell id by the input para
cids= readLines( input );
cids=cids[id1:id2]

# a time-consuming job
work=function(id){
  Sys.sleep(0.01 + runif(1)*0.8);
  return( as.numeric(id)+1);
}

# do the analysis
df=NULL;
for(i in 1:length(cids)){
 # cat(i, cids[i], "\n");
 id=cids[i];
 df=rbind(df,  data.frame(
    id=id,
    result=work(id)
  ));
}
#print(df);
#write.table(df,  paste0("tmp/result_",id1, "_", id2, ".txt"), col.names=F, quote = F )
write.table(df, output, col.names=F, quote = F )
