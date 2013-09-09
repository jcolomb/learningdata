#subneg=6500
#setwd("/Users/choupi/Desktop/boulot/FSdata")
source("graph/getdata.r")
title ="PKCi: motorneurons lines"


		datatest= metafile[metafile$experimentid== "16_PKCi_d42G4_chaG80_c380" ,]
		datatest=droplevels(datatest)
		
datatest2=datatest
		for (i in 1:length(levels(datatest2$experimentid))){
			totest= subset (datatest2,datatest2$experimentid==levels(datatest2$experimentid)[i])
			totest=droplevels(totest)
			n= length(levels(totest$genotype))
			print(paste(n,levels(datatest2$experimentid)[i]))
			if (n<2) datatest2= datatest2[datatest2$experimentid != levels(datatest2$experimentid)[i],]
		}
	#datatest2$genotype2 <- factor(datatest2$genotype)
	
	levels(datatest2$shortname)
neworder2= c(2,1,4,3)
datatest2$shortname <- factor(datatest2$shortname, levels = levels(datatest2$shortname)[neworder2])
levels(datatest2$genotypefull)
neworder= c(1,2,3,4)
datatest2$genotypefull2 <- factor(datatest2$genotypefull,levels = levels(datatest2$genotypefull)[neworder])
#levels(datatest2$genotype2)
levels(datatest2$shortname)
levels(datatest2$genotypefull2)


source ("graph/makegraph.r")

ggsave(file=paste("graph/pdf/",title,".pdf", sep=""), plot=plot,scale=1)


sink("graph/legends.txt", append=TRUE)
cat(additional_text)
sink()

# datatest2$scorenotrel_asin =asin(sqrt((datatest2$score+1)/2))
# zero=asin(sqrt(0.5))
# pkci=datatest2[datatest2$genotype=="PKC_c380",]
# cs=datatest2[datatest2$genotype=="CS_c380",]
# t.test(cs$scorenotrel_asin,pkci$scorenotrel_asin, alternative="greater")
# 
# t.test(cs$scorenotrel_asin, mu=zero,alternative="two.sided")
#   t.test(pkci$scorenotrel_asin, mu=zero,alternative="two.sided")
#   
#   
# pkci=datatest2[datatest2$genotype=="PKC_c380",]
# cs=datatest2[datatest2$genotype=="CS_c380",]
# wt <-wilcox.test(cs$score, alternative="greater")
#   wt
#   #wilcox.test(cs$score, alternative="two.sided")
#   wilcox.test(pkci$score, alternative="two.sided")
#   #wilcox.test(cs$score,pkci$score, alternative="two.sided")  
#   
# #sink("graph/legends.txt", append=TRUE)
# #cat(". ")
# #sink()
# 	
# 	# datatest2= droplevels(datatest2)
# 	
# 	# levels(datatest2$genotype)
# 	# neworder= c(1,2,3,4,6,7,5)
# 	# datatest2$genotype2 <- factor(datatest2$genotype, levels = levels(datatest2$genotype)[neworder])
# 	# levels(datatest2$shortname)
# 	# neworder= c(2,5,6,1,4,7,3)
# 	# datatest2$shortname <- factor(datatest2$shortname, levels = levels(datatest2$shortname)[neworder])
# 	# levels(datatest2$genotypefull)
# 	# neworder= c(1,3,4,7,2,6,5)
# 	# datatest2$genotypefull2 <- factor(datatest2$genotypefull,levels = levels(datatest2$genotypefull)[neworder])
# 	# levels(datatest2$genotype2)
# 	# levels(datatest2$shortname)
# 	# levels(datatest2$genotypefull2)
# 	
# 	# source ("graph/makegraph.r")
# 	
# 	# ggsave(file=paste("graph/pdf/",title,".pdf", sep=""), plot=plot,scale=1)
# 
