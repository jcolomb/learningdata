if(numberplot==0){
	require (ggplot2)
	require (plyr)
	require(gridExtra)
	
}
numberplot=numberplot+1

metafile= read.csv ("metafile.csv", header=TRUE)[,-1]
metafile$X1_pretest1= suppressWarnings(as.numeric (as.character(metafile$X1_pretest1)) )
metafile$X9_test3	= suppressWarnings(as.numeric (as.character(metafile$X9_test3)) )
metafile$laser.power=suppressWarnings(as.numeric (as.character(metafile$laser.power)) )
##get data with remarks out

metafile=subset (metafile, is.na(metafile$remarks))

Names= read.csv ("shortnames.csv", header=TRUE,)[,-1]
Names[,3]=as.factor(gsub("RL","\n",Names[,2]))
Names[,4]=as.factor(gsub("RL","",Names[,2]))

levels(Names[,1])= c(levels(Names[,1]),levels(metafile$genotype))
#Names[,1][Names[,1]=="PKC_elav_34"]=as.factor("PKC_elav_34\xb0") 

metafile$shortname=metafile$genotype
metafile$shortnamelegend = metafile$genotype
levels(metafile$shortname)= c(levels(metafile$shortname), levels(Names[,3]))
for (i in 1: length(levels(metafile$genotype))){
	#print(i)
	metafile$shortname[metafile$genotype==levels(metafile$genotype)[i]]= as.character(Names[Names[,1]==levels(metafile$genotype)[i],3])
}
metafile$shortname=droplevels(metafile$shortname)

levels(metafile$shortnamelegend)= c(levels(metafile$shortnamelegend), levels(Names[,4]))
for (i in 1: length(levels(metafile$genotype))){
	#print(i)
	metafile$shortnamelegend[metafile$genotype==levels(metafile$genotype)[i]]= as.character(Names[Names[,1]==levels(metafile$genotype)[i],4])
}
metafile$shortnamelegend =droplevels(metafile$shortnamelegend)


#datatest= subset (metafile, metafile$treatment =="Heatshock_32d_3days__25dfor30-90min")
#datatest= droplevels(datatest)
#levels(datatest$genotypefull)
#levels(datatest$experimentid)