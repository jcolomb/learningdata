#setwd("/Users/choupi/Desktop/boulot/FSdata")
source("graph/getdata.r")
title="PKC53e & Inac RNAi experiments"
datatest2= metafile[metafile$experimentid %in% c("20_PKCRNAI"  ),]

datatest2= droplevels(datatest2)

levels(datatest2$genotype)
neworder= c(1,2,3)
datatest2$genotype2 <- factor(datatest2$genotype, levels = levels(datatest2$genotype)[neworder])
levels(datatest2$shortname)
neworder2= c(1,2,3)
datatest2$shortname <- factor(datatest2$shortname, levels = levels(datatest2$shortname)[neworder2])
levels(datatest2$genotypefull)
#neworder= c(1,2,3)
datatest2$genotypefull2 <- factor(datatest2$genotypefull,levels = levels(datatest2$genotypefull)[neworder])

source ("graph/makegraph.r")

ggsave(file=paste("graph/pdf/",title,".pdf", sep=""), plot=plot,scale=1)