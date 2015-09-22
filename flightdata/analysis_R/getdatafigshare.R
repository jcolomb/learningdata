require(rfigshare) 

options(FigshareKey = "jBkrLNsYbeov2oM09cXBBw")
options(FigsharePrivateKey = "LhQkDeJaVJzAhWRIKYeobA")
options(FigshareToken = "BYuYn4OjWjd8njBKCyeFXQOEAYY1MfLJ1Y0z80rVWj6AXYuYn4OjWjd8njXKCyeFXQ")
options(FigsharePrivateToken = "aC2q4lBod3Xl52CeKwp7Fg")

fs_auth()
metafileurl= fs_download (695950)

metafile =read.csv(metafileurl)
metafile$X1_pretest1= suppressWarnings(as.numeric (as.character(metafile$X1_pretest1)) )
metafile$X9_test3	= suppressWarnings(as.numeric (as.character(metafile$X9_test3)) )
metafile$laser.power=suppressWarnings(as.numeric (as.character(metafile$laser.power)) )
##get data with remarks out

metafile=subset (metafile, is.na(metafile$remarks))