sourcefolder="/Users/colombj/Gits/learningdata/flightdata/analysis_R"
datafolder="~/Desktop/boulot/FSdata"
require(rfigshare)
fs_auth()
id= 695950 
##first time to get the data on figshare
# setwd(sourcefolder)
# fs_upload(id, "metafile.csv")



file= fs_download(id)

metafile= read.csv (file, header=TRUE)[,-1]
metafile$X1_pretest1= suppressWarnings(as.numeric (as.character(metafile$X1_pretest1)) )
metafile$X9_test3  = suppressWarnings(as.numeric (as.character(metafile$X9_test3)) )
metafile$laser.power=suppressWarnings(as.numeric (as.character(metafile$laser.power)) )
if(is.null(metafile$figshareid[1])){
  metafile$figshareid= rep(NA,length(metafile$laser.power))
}

i=1
MINE=TRUE
setwd(datafolder)
newmetafile=metafile
for (i in c(1: length(levels(metafile$experimentid)))){
  thisexp= levels(metafile$experimentid)[i]
  submetaf = subset(newmetafile, newmetafile$experimentid == thisexp)
  submetaf=droplevels(submetaf)
  ## creating or recuperating figshareid
  if(is.na(submetaf$figshareid[1])){
    thisfigshareid=fs_create(
      paste("rawfiles for ", thisexp),
      "This data is raw data from flight experiment, see the metadata figshare article for a description. data start at line 21, data is in 4 rows: time, torque, is_laser_on, sequence_ number (meaning depends on the protocol, usually 2 min. periods).",
      type = "fileset",
      
    )
    fs_add_authors(thisfigshareid,list("96464","97229"))
  }else{thisfigshareid=submetaf$figshareid[1]}
  
  #thisfigshareid=829574
  setwd(datafolder)
  ## get list of data already uploaded
  detail=fs_details(thisfigshareid, mine = MINE)
  a=sapply(detail$files, function(x) x$name) 
  ### loop to upload each file not already up
  
  for (j in c(1: length(submetaf$rawfilename))){
    if (all(!grepl(submetaf$rawfilename[j],a))){
      data = submetaf$rawfilename[j]
      if (!data== "not_accessible"){
        fs_upload(thisfigshareid, file = paste("alldata",submetaf$rawfilename[j], sep="/"))
        }
      
    }else{print("already uploaded")}
  }	
  ### endloop to upload each file not already up
  submetaf$figshareid[submetaf$rawfilename!="not_accessible"]= thisfigshareid		
  newmetafile = subset(newmetafile, newmetafile$experimentid != thisexp)
  newmetafile = rbind(newmetafile,submetaf)
  #write.csv (newmetafile, file = "metafile.csv")		
  fs_make_public(thisfigshareid)
  #read.csv(paste("alldata",submetaf$rawfilename[j], sep="/"))
}		
