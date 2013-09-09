setwd("/Users/choupi/Desktop/boulot/FSdata")
source("graph/getdata.r")
subneg= TRUE

for (i in c(2: length(levels(metafile$experimentid)))){##exp1_1  is only 2 points (prepre-tests at 34°)
	print(i)	
	
		test=levels(metafile$experimentid)[i]
		datatest= metafile[metafile$experimentid==test,]
		datatest=droplevels(datatest)
		title = paste (test,": ",levels(datatest$treatment)[1])
		
		datatest2=datatest
		for (i in 1:length(levels(datatest2$experimentid))){
			totest= subset (datatest2,datatest2$experimentid==levels(datatest2$experimentid)[i])
			totest=droplevels(totest)
			n= length(levels(totest$genotype))
			print(paste(n,levels(datatest2$experimentid)[i]))
			if (n<2) datatest2= datatest2[datatest2$experimentid != levels(datatest2$experimentid)[i],]
		}
	datatest2$genotype2 <- factor(datatest2$genotype)
	datatest2$genotypefull2 <- factor(datatest2$genotypefull)	
	source ("graph/makegraph.r")
	ggsave(file=paste("graph/pdf/allexp/",title,".pdf", sep=""), plot=plot,scale=1)
	
}	
	
	
	# datatest2= droplevels(datatest2)
	
	# levels(datatest2$genotype)
	# neworder= c(1,2,3,4,6,7,5)
	# datatest2$genotype2 <- factor(datatest2$genotype, levels = levels(datatest2$genotype)[neworder])
	# levels(datatest2$shortname)
	# neworder= c(2,5,6,1,4,7,3)
	# datatest2$shortname <- factor(datatest2$shortname, levels = levels(datatest2$shortname)[neworder])
	# levels(datatest2$genotypefull)
	# neworder= c(1,3,4,7,2,6,5)
	# datatest2$genotypefull2 <- factor(datatest2$genotypefull,levels = levels(datatest2$genotypefull)[neworder])
	# levels(datatest2$genotype2)
	# levels(datatest2$shortname)
	# levels(datatest2$genotypefull2)
	
	# source ("graph/makegraph.r")
	
	# ggsave(file=paste("graph/pdf/",title,".pdf", sep=""), plot=plot,scale=1)

