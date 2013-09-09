#setwd("/Users/choupi/Desktop/boulot/FSdata")

source("graph/getdata.r")

title="Putative mutants: no phenotype"

datatest2= metafile[metafile$experimentid %in% c("10_PKCinac_putativemutant","11_PKCdelta_putativemutant","9_PKC53_putativemutant_mi"),]
datatest2= droplevels(datatest2)
levels(datatest2$genotype)

#datatest2= datatest2[datatest2$genotype %in% c("mutant","pinac","PKC-", "pkc53" ,"PKC53e-/-" ,"wtb" ,"control","Control" ),]
#datatest2= droplevels(datatest2)

for (i in 1:length(levels(datatest2$experimentid))){
	totest= subset (datatest2,datatest2$experimentid==levels(datatest2$experimentid)[i])
	totest=droplevels(totest)
	n= length(levels(totest$genotype))
	print(paste(n,levels(datatest2$experimentid)[i]))
	if (n<2) datatest2= datatest2[datatest2$experimentid != levels(datatest2$experimentid)[i],]
}
datatest2= droplevels(datatest2)

#levels(datatest2$genotype)
#neworder= c(1,3,2)
#datatest2$genotype2 <- factor(datatest2$genotype, levels = levels(datatest2$genotype)[neworder])
levels(datatest2$shortname)
neworder2= c(1,2,3,4)
datatest2$shortname <- factor(datatest2$shortname, levels = levels(datatest2$shortname)[neworder2])
levels(datatest2$genotypefull)
neworder= c(1,2,3,4)
datatest2$genotypefull2 <- factor(datatest2$genotypefull,levels = levels(datatest2$genotypefull)[neworder])
levels(datatest2$genotype2)
levels(datatest2$shortname)
levels(datatest2$genotypefull2)

source ("graph/makegraph.r")

#ggsave(file=paste("graph/pdf/","mutant",".pdf", sep=""), plot=plot,scale=1)


