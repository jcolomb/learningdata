## upload data
setwd(datafolder)
i= c(1:datapoints)
rawfilenames <- sapply(i,function(v) {
	paste(filenameprefix,v,".txt",sep="")
})
filenames <- sapply(i,function(v) {
	paste(filenameprefix,v,".txt.TXT",sep="")
})
dat <- lapply(filenames,function(name) {
	suppressWarnings(
read.table(name,header=FALSE, sep ="\t", col.names= paste ("V",1:18),fill=TRUE))
})
for (j in i){
	dat[[j]]$V.18=as.character(dat[[j]]$V.18)
	dat[[j]]$V.17=as.character(dat[[j]]$V.17)
	
}
data=do.call(rbind,dat)

headnames <- sapply(0,function(v) {
	paste(filenameprefix,v,".txt.TXT", sep ="")
})
head <- lapply(headnames,function(name) {
	read.table(name,header=TRUE, sep ="\t")
})

head=do.call(rbind,head)

names(data) <- names (head)

oldnames=levels(data$genotype)
print(oldnames)

setwd(sourcefolder)