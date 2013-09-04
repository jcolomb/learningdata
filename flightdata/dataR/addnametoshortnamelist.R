Names= read.csv ("shortnames.csv", header=TRUE,)[,-1]
Names[,3]=as.factor(gsub("RL","\n",Names[,2]))

levels(Names[,1])= c(levels(Names[,1]),levels(metafile$genotype))
Names[,1][Names[,1]=="PKC_elav_34"]=as.factor("PKC_elav_34\xb0") 

newname=levels(metafile$genotype)
toadd=c()
toadd2=c()
for (i in 1:length(newname)){
	test=newname[i]
	if(all(Names[,1]!=test)) {
	toadd = c(toadd,test)
	toadd2 = c(toadd2,as.character(metafile$genotypefull[metafile$genotype == test][1])	)
	}
	
}
tobind=data.frame(toadd, toadd, toadd2)
colnames(tobind)=colnames(Names)
Names2= rbind(Names,tobind)
write.csv(file=("shortname.csv"), Names2)