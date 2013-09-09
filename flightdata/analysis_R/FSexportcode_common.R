
# # ## upload data
# i= c(1:datapoints)
# rawfilenames <- sapply(i,function(v) {
	# paste(filenameprefix,v,".txt",sep="")
# })
# filenames <- sapply(i,function(v) {
	# paste(filenameprefix,v,".txt.TXT",sep="")
# })
# dat <- lapply(filenames,function(name) {
	# suppressWarnings(
# read.table(name,header=FALSE, sep ="\t", col.names= paste ("V",1:18),fill=TRUE))
# })
# data=do.call(rbind,dat)

# headnames <- sapply(0,function(v) {
	# paste(filenameprefix,v,".txt.TXT", sep ="")
# })
# head <- lapply(headnames,function(name) {
	# read.table(name,header=TRUE, sep ="\t")
# })

# head=do.call(rbind,head)

# names(data) <- names (head)
# ### write treatment and co



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




## calculate mean_before, scores

pretest1=suppressWarnings (as.numeric(data$X1_pretest1))
data$mean_pretest = ifelse (is.na(pretest1) ,data$X2_pretest2 /10000,(pretest1 + data$X2_pretest2)/20000)
data$score = data$X8_test2/10000
data$scorerelative= data$score-data$mean_pretest

## writing raw data
for (j in i){
	FILENAME <- paste("alldata/",experimentid,"_",j,".csv", sep="")
	if (!file.exists(FILENAME)){
		a=read.table(rawfilenames[j], col.names= c("time","torque","period","laseron"), fill=TRUE)
		write.csv(a,file=FILENAME)
	}
	data$rawfilename[j]= paste(experimentid,"_",j,".csv", sep="")
}
data$remarks= as.factor(data$remarks)
data$remarksnotimportant= as.factor(data$remarksnotimportant)
 