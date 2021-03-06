setwd(datafolder)
metafile= read.csv ("metafile.csv", header=TRUE)[,-1]
metafile$X1_pretest1= suppressWarnings(as.numeric (as.character(metafile$X1_pretest1)) )
metafile$X9_test3	= suppressWarnings(as.numeric (as.character(metafile$X9_test3)) )
metafile$laser.power=suppressWarnings(as.numeric (as.character(metafile$laser.power)) )

oldmetafile = metafile[metafile$experimentid == experimentid,]

if (is.na(oldmetafile$figshareid[1])){data$figshareid<- NA
	}else{data$figshareid<- oldmetafile$figshareid[1]}

if (!all(colnames(data) == colnames(metafile))) stop("data not correct, difference in columns")

newmetafile = metafile [metafile$experimentid !=experimentid,]
newmetafile = rbind(newmetafile,data)
write.csv (newmetafile, file = "metafile.csv")

# levels(metafile$experimentid)= c(metafile$experimentid,"2_PKC53emutant_outcrossed")
# metafile$experimentid[is.na(metafile$experimentid)] =as.factor("2_PKC53emutant_outcrossed")
# newmetafile=metafile
setwd(sourcefolder)