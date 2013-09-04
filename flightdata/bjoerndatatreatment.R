i= c(1:nrow(data))

for (j in i){
	data$experimentid [j] <- experimentid
	data$treatment[j] <-treatment
	data$experimentator[j] <-experimentator
}


### new genotype names
oldnames=levels(data$genotype)
oldnames
###stop and change new names

for (j in 1:length(oldnames)){
	data$genotypefull[data$genotype == oldnames[j]]=newnames[j]
}


pretest1=suppressWarnings (as.numeric(data$X1_pretest1))
data$mean_pretest = ifelse (is.na(pretest1) ,data$X2_pretest2 /10000,(pretest1 + data$X2_pretest2)/20000)
data$score = data$X8_test2/10000
data$scorerelative= data$score-data$mean_pretest

for (j in i){
	data$rawfilename[j]= "not_accessible"
}

metafile= read.csv ("metafile.csv", header=TRUE, )[,-1]

metafile$X1_pretest1= suppressWarnings(as.numeric (as.character(metafile$X1_pretest1)) )
metafile$X9_test3	= suppressWarnings(as.numeric (as.character(metafile$X9_test3)) )

if (!all(colnames(data) == colnames(metafile))) stop("data not correct, difference in columns")
test =experimentid
newmetafile = subset(metafile, (metafile$experimentid != test | metafile$experimentator !="Bjoern Brembs"))

newmetafile=rbind(newmetafile,data)
write.csv (newmetafile, file = "metafile.csv")