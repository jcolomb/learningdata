#c380 analysis

setwd("/Users/choupi/Desktop/boulot/FSdata")
source("graph/getdata.r")
title="c380"

datatest2= metafile[metafile$treatment %in% c("Heatshock_35d_4h__25dfor1-4h"  ),]
datatest2= droplevels(datatest2)
levels(datatest2$genotype)
datatest2= datatest2[datatest2$genotype %in% c("CS_c380","PKC_c380" ,"PKC_CS"),]
datatest2= droplevels(datatest2)

for (i in 1:length(levels(datatest2$experimentid))){
	totest= subset (datatest2,datatest2$experimentid==levels(datatest2$experimentid)[i])
	totest=droplevels(totest)
	n= length(levels(totest$genotype))
	print(paste(n,levels(datatest2$experimentid)[i]))
	if (n<2) datatest2= datatest2[datatest2$experimentid != levels(datatest2$experimentid)[i],]
}
datatest2= droplevels(datatest2)

boxplot(datatest2$score~datatest2$genotype)
summary(datatest2$genotype)
subneg=TRUE
if(subneg){
	datatest2 = subset (datatest2, datatest2$X2_pretest2 > -6000)
	datatest2 = subset (datatest2, datatest2$X2_pretest2 <  6000)
	}
boxplot(datatest2$score~datatest2$genotype)	
pkci=datatest2[datatest2$genotype=="PKC_c380",]
cs=datatest2[datatest2$genotype=="CS_c380",]
wt <-wilcox.test(cs$score, alternative="greater")
  wt
  wilcox.test(cs$score, alternative="two.sided")
  wilcox.test(pkci$score, alternative="two.sided")
  wilcox.test(cs$score,pkci$score, alternative="two.sided")
  
a=pkci$score
 mean(a)
 sd(a)/sqrt(length(a-1))
 a=cs$score
 mean(a)
 sd(a)/sqrt(length(a-1))