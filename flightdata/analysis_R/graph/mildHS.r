setwd("/Users/choupi/Desktop/boulot/FSdata")
source("graph/getdata.r")
title="Mild heat shocks (pooled)"

datatest2= metafile[metafile$treatment %in% c("Heatshock_33d_15h__25dfor2-8h","HeatShock_34d_2h__RT1-4h","Heatshock_36d_2h__25dfor1-4h","Heatshock_37d_1h__25dfor1-4h"  ),]
datatest2= droplevels(datatest2)
levels(datatest2$genotype)
#datatest2= datatest2[datatest2$genotype %in% c("CS_c380","CS_d42","CS_OK371", "PKC_c380" ,"PKC_CS" ,"PKC_d42" ,"PKC_OK371" ),]
#datatest2= droplevels(datatest2)

for (i in 1:length(levels(datatest2$experimentid))){
	totest= subset (datatest2,datatest2$experimentid==levels(datatest2$experimentid)[i])
	totest=droplevels(totest)
	n= length(levels(totest$genotype))
	print(paste(n,levels(datatest2$experimentid)[i]))
	if (n<2) datatest2= datatest2[datatest2$experimentid != levels(datatest2$experimentid)[i],]
}
datatest2= droplevels(datatest2)

levels(datatest2$genotype)
neworder= c(1,3,2)
datatest2$genotype2 <- factor(datatest2$genotype, levels = levels(datatest2$genotype)[neworder])
levels(datatest2$shortname)
neworder2= c(2,3,1)
datatest2$shortname <- factor(datatest2$shortname, levels = levels(datatest2$shortname)[neworder2])
levels(datatest2$genotypefull)
neworder= c(1,2,3)
datatest2$genotypefull2 <- factor(datatest2$genotypefull,levels = levels(datatest2$genotypefull)[neworder])
levels(datatest2$genotype2)
levels(datatest2$shortname)
levels(datatest2$genotypefull2)

source ("graph/makegraph.r")

ggsave(file=paste("graph/pdf/",title,".pdf", sep=""), plot=plot,scale=1)

sink("graph/legends.txt", append=TRUE)
cat(". Different protocols were tested: Heat shock at 33° for 15h, 36° for 2h, and 37°for 1h")
sink()