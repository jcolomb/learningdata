setwd("/Users/choupi/Desktop/boulot/FSdata")
source("graph/getdata.r")
title="Presence of a second UAS \n prevents the PKC inhibition"

datatest2= metafile[metafile$treatment %in% c("Heatshock_35d_4h__25dfor1-4h"  ),]
datatest2= droplevels(datatest2)


levels(datatest2$experimentid)
datatest2= datatest2[datatest2$experimentid %in% c("17_PKCi_d42G4w_woUASGFP","18_PKCi_d42G4HAg80_c380_UASGFP" ),]
datatest2= droplevels(datatest2)
levels(datatest2$genotype)
datatest2= datatest2[!datatest2$genotype %in% c("CS_d42","PKC_d42"),]
datatest2= droplevels(datatest2)

for (i in 1:length(levels(datatest2$experimentid))){
	totest= subset (datatest2,datatest2$experimentid==levels(datatest2$experimentid)[i])
	totest=droplevels(totest)
	n= length(levels(totest$genotype))
	print(paste(n,levels(datatest2$experimentid)[i]))
	if (n<2) datatest2= datatest2[datatest2$experimentid != levels(datatest2$experimentid)[i],]
}
datatest2= droplevels(datatest2)

#levels(datatest2$genotype)
#neworder= c(1,2,3,4,6,7,5)
#datatest2$genotype2 <- factor(datatest2$genotype, levels = levels(datatest2$genotype)[neworder])
levels(datatest2$shortname)
neworder2= c(1,2,3,5,4,6,7)
datatest2$shortname <- factor(datatest2$shortname, levels = levels(datatest2$shortname)[neworder2])
levels(datatest2$genotypefull)
neworder= c(3,2,1,7,6,4,5)
datatest2$genotypefull2 <- factor(datatest2$genotypefull,levels = levels(datatest2$genotypefull)[neworder])
#levels(datatest2$genotype2)
levels(datatest2$shortname)
levels(datatest2$genotypefull2)
data.frame(levels(datatest2$shortname),levels(datatest2$genotypefull2))

source ("graph/makegraph.r")

ggsave(file=paste("graph/pdf/",title,".pdf", sep=""), plot=plot,scale=1)