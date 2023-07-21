#differential expression analysis for RNA-seq data

library("DESeq2")

#input gene expression data： raw count matrix
count=read.csv("count.csv",row.names = 1)

#input sample group file
group=read.csv("group.csv")


dds=DESeqDataSetFromMatrix(countData = count,colData = group,design = ~ group)
deg=DESeq(dds)
res=results(deg)
write.csv(res,"deg.csv")
