require(plotrix)
require(MASS)
require (vioplot)
require (UsingR)
require (gplots)
require (lattice)
require (gdata)
require (rfigshare)
require (ggplot2)
require (plyr)

Pvalue <- function(x){
	wt <-wilcox.test(x, alternative="greater")
	P=wt$p.value
	ret=""
	if (P<0.05) ret="*"
	if (P<0.01) ret="**"
	return=ret
}

theme_set(theme_bw())

theme_jack <- function (base_size = 12, base_family = "") {
    theme_bw(base_size = base_size, base_family = base_family) %+replace% 
        theme(
            #axis.text = element_text(colour = "white"),
            #axis.title.x = element_text(colour = "pink", size=rel(3)),
            #axis.title.y = element_text(colour = "blue", angle=45),
            #panel.background = element_rect(fill="green"),
            #panel.grid.minor.y = element_line(size=3),
            panel.grid.major = element_line(colour = "grey")#,
           # plot.background = element_rect(fill="red")
           #,panel.grid = element_blank()
           ,panel.grid.major.x = element_blank() 
           #,axis.text.x = element_text(angle=90, vjust=0)



    )   
}
theme_set(theme_jack())




#### experiment detail
setwd("/Users/choupi/Desktop/boulot/FSdata")

metafile= read.csv ("metafile.csv", header=TRUE)[,-1]
metafile$X1_pretest1= suppressWarnings(as.numeric (as.character(metafile$X1_pretest1)) )
metafile$X9_test3	= suppressWarnings(as.numeric (as.character(metafile$X9_test3)) )
metafile$laser.power=suppressWarnings(as.numeric (as.character(metafile$laser.power)) )
##get data with remarks out

metafile=subset (metafile, is.na(metafile$remarks))

## choose data

levels(metafile$treatment)

datatest= subset (metafile, metafile$treatment == "Heatshock_35d_4h__25dfor1-4h")
datatest= droplevels(datatest)
levels(datatest$genotypefull)
levels(datatest$experimentid)

datatest2= datatest[datatest$experimentid %in% c("10_PKCinac_putativemutant","11_PKCdelta_putativemutant","9_PKC53_putativemutant_mi","2_PKC53emutant_outcrossed"  ),]
datatest2= droplevels(datatest2)

levels(datatest2$genotypefull)
neworder= c(1,4,6,2,5,3)
datatest2$genotypefull2 <- factor(datatest2$genotypefull, levels = levels(datatest2$genotypefull)[neworder])
datatest2$genotypefull3 <- factor(substr(datatest2$genotypefull2, 0, 12),levels = levels(datatest2$genotypefull3)[neworder])


title="Different PKC putative mutants show no phenotypes"

data.size <- ddply(datatest2, .(genotypefull3), summarize, n=length(score), score=median(score)-0.1) ##"score" need to be calculated at the end, need to be named score
data.size2<- ddply(datatest2, .(genotypefull3), summarize , star=Pvalue(score),score=median(score)+0.05)
data.size	

p=ggplot(datatest2, aes(x=factor(genotypefull3),y= score, fill= genotypefull2))
p+ geom_boxplot()+ labs(x="genotype",y="PI during final test", title=title)+ ylim(-1.2, 1)+
scale_fill_grey(start = 0.4, end = 1)



p=ggplot(datatest2, aes(x=factor(genotypefull3),y= score, fill= genotypefull3))
 p+ geom_boxplot()+ labs(x="genotype",y="PI during final test", title=title)+ ylim(-1.2, 1)+
 scale_fill_grey(start = 0.4, end = 1)+ ##allow good bw prints
 

 geom_text(aes(y= -1.1,label=paste("n =", n)), data=data.size) + geom_text(aes(label=paste(star)), data=data.size2) 




newname ="test"
levels(metafile$genotype)=c(levels(metafile$genotype),newname)
metafile$genotype[metafile$genotype==levels(metafile$genotype)[x]]=newname


##help to change genotype name
# changename <- function(metafile){
	# MET=metafile
	# output= data.frame()
	# for (x in 1: length(levels(metafile$genotype))){
		# print(levels(metafile$genotype)[x])
		# print(metafile$genotypefull[metafile$genotype==levels(metafile$genotype)[x]][1])
		# cat("give a new name")
		# newname=""
		# #newname= readLines(n=1)
		# if(!newname=="") {
			# # print(newname)
			# # levels(MET$genotype)=c(levels(MET$genotype),newname)
			# # MET$genotype[MET$genotype==levels(metafile$genotype)[x]]=newname
			# # MET$genotype= droplevels(MET$genotype)
			# Namechange= data.frame(levels(metafile$genotype)[x],newname)
			
			# }else{Namechange= data.frame(levels(metafile$genotype)[x],levels(metafile$genotype)[x],metafile$genotypefull[metafile$genotype==levels(metafile$genotype)[x]][1])}
		# output= rbind(output,Namechange)
		# }
	# # return=MET
	# return = output
# }
# shortname=changename(metafile)
# write.csv(file="shortname_ori.csv",shortname)

metafile$genotype[metafile$genotype=="PKCRNAi_VxelavtG80"]="elav_tG80xPKCRNAi_V"
newmetafile=metafile