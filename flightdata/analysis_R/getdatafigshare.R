require(rfigshare) 

#options(FigshareKey = "jBkrLNsYbeov2oM09cXBBw")
#options(FigsharePrivateKey = "LhQkDeJaVJzAhWRIKYeobA")
#options(FigshareToken = "BYuYn4OjWjd8njBKCyeFXQOEAYY1MfLJ1Y0z80rVWj6AXYuYn4OjWjd8njXKCyeFXQ")
#options(FigsharePrivateToken = "aC2q4lBod3Xl52CeKwp7Fg")

fs_auth()
metafileurl= fs_download (695950)

metafile =read.csv(metafileurl)
metafile$X1_pretest1= suppressWarnings(as.numeric (as.character(metafile$X1_pretest1)) )
metafile$X9_test3	= suppressWarnings(as.numeric (as.character(metafile$X9_test3)) )
metafile$laser.power=suppressWarnings(as.numeric (as.character(metafile$laser.power)) )
##get data with remarks out

metafile=subset (metafile, is.na(metafile$remarks))

Namesurl= fs_download(1552031)
Names= read.csv (Namesurl, header=TRUE,)[,-1]

Names[,3]=as.factor(gsub("RL","\n",Names[,2]))
Names[,4]=as.factor(gsub("RL","",Names[,2]))
levels(Names[,1])= c(levels(Names[,1]),levels(metafile$genotype))
metafile$shortname=metafile$genotype
metafile$shortnamelegend = metafile$genotype
levels(metafile$shortname)= c(levels(metafile$shortname), levels(Names[,3]))
for (i in 1: length(levels(metafile$genotype))){
#print(i)
metafile$shortname[metafile$genotype==levels(metafile$genotype)[i]]= as.character(Names[Names[,1]==levels(metafile$genotype)[i],3])
}
metafile$shortname=droplevels(metafile$shortname)
metafile$shortnamelegend =droplevels(metafile$shortnamelegend)

levels(metafile$shortnamelegend)= c(levels(metafile$shortnamelegend), levels(Names[,4]))
for (i in 1: length(levels(metafile$genotype))){
#print(i)
metafile$shortnamelegend[metafile$genotype==levels(metafile$genotype)[i]]= as.character(Names[Names[,1]==levels(metafile$genotype)[i],4])
}

Names= read.csv (Namesurl, header=TRUE,)[,-1]
