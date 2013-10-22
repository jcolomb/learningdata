

options(FigshareKey = "jBkrLNsYbeov2oM09cXBBw")
options(FigsharePrivateKey = "LhQkDeJaVJzAhWRIKYeobA")
options(FigshareToken = "BYuYn4OjWjd8njBKCyeFXQOEAYY1MfLJ1Y0z80rVWj6AXYuYn4OjWjd8njXKCyeFXQ")
options(FigsharePrivateToken = "aC2q4lBod3Xl52CeKwp7Fg")
fs_auth()

setwd(datafolder)
metafile= read.csv ("metafile.csv", header=TRUE)[,-1]
metafile$X1_pretest1= suppressWarnings(as.numeric (as.character(metafile$X1_pretest1)) )
metafile$X9_test3	= suppressWarnings(as.numeric (as.character(metafile$X9_test3)) )
metafile$laser.power=suppressWarnings(as.numeric (as.character(metafile$laser.power)) )


#metafile$figshareid<- NA
#metafile$figsharefilename<- NA

MINE =TRUE
##loop for every experimentid
for (i in c(1: 2)){#length(levels(metafile$experimentid)))){
thisexp= levels(metafile$experimentid)[i]
	submetaf = subset(metafile, metafile$experimentid == thisexp)
	submetaf=droplevels(submetaf)
	## creating or recuperating figshareid
	if(is.na(submetaf$figshareid[1])){
		thisfigshareid=fs_create(
		paste("rawfiles for ", thisexp),
		"This data is raw data from flight experiment, see the metadata figshare article for a description. data start at line 21, data is in 4 rows: time, torque, is_laser_on, sequence_ number (meaning depends on the protocol, usually 2 min. periods).",
		type = "fileset"
		)
		}else{thisfigshareid=submetaf$figshareid[1]}
		
		#thisfigshareid=829574
	#setwd(datafolder)
	## get list of data already uploaded
		detail=fs_details(thisfigshareid, mine = MINE)
		a=sapply(detail$files, function(x) x$name) 
		### loop to upload each file not already up
		for (j in c(1: length(submetaf$rawfilename))){
			if (all(!grepl(submetaf$rawfilename[j],a))){
				fs_upload(thisfigshareid, file = paste("alldata",submetaf$rawfilename[j], sep="/"))
			}else{print("already uploaded")}
			
		submetaf$figshareid= thisfigshareid
		
	}	
	### endloop to upload each file not already up
		
newmetafile = subset(metafile, metafile$experimentid != thisexp)
newmetafile = rbind(newmetafile,submetaf)
write.csv (newmetafile, file = "metafile.csv")		
		#read.csv(paste("alldata",submetaf$rawfilename[j], sep="/"))
}		
###end loop every experiment		
	
		