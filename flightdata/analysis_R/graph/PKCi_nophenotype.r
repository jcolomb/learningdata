setwd("/Users/choupi/Desktop/boulot/FSdata")
source("graph/getdata.r")
title="PKCi: Gal4 without phenotype"

datatest2= metafile[metafile$treatment %in% c("Heatshock_35d_4h__25dfor1-4h"  ),]
datatest2= droplevels(datatest2)
datatest2= datatest2[datatest2$genotype %in% c("PKC_7y_819","PKC_c232","PKC_H24"),]
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

sink("graph/legends.txt", append=TRUE)
cat(additional_text)
sink()