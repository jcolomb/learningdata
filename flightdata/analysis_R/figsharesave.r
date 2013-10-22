options(FigshareKey = "jBkrLNsYbeov2oM09cXBBw")
options(FigsharePrivateKey = "LhQkDeJaVJzAhWRIKYeobA")
options(FigshareToken = "BYuYn4OjWjd8njBKCyeFXQOEAYY1MfLJ1Y0z80rVWj6AXYuYn4OjWjd8njXKCyeFXQ")
options(FigsharePrivateToken = "aC2q4lBod3Xl52CeKwp7Fg")
fs_auth()

metafile= read.csv ("metafile.csv", header=TRUE)[,-1]
metafile$X1_pretest1= suppressWarnings(as.numeric (as.character(metafile$X1_pretest1)) )
metafile$X9_test3	= suppressWarnings(as.numeric (as.character(metafile$X9_test3)) )
metafile$laser.power=suppressWarnings(as.numeric (as.character(metafile$laser.power)) )

metafile$figshareid= as.numeric(metafile$genotype)
test =experimentid
i=1
	submetaf = subset(metafile, metafile$experimentid == levels(metafile$experimentid)[i])
	if(is.na(submetaf$figshareid[1]))