if(is.na(subneg)){subneg=6000}

	datatest2 = subset (datatest2, datatest2$X2_pretest2 > -subneg)
	datatest2 = subset (datatest2, datatest2$X2_pretest2 <  subneg)
	

Pvalue <- function(x){
	x_tra= asin(sqrt(x/2 + 0.5))
	wt <-t.test(x_tra, mu=asin(sqrt(0.5)), alternative="two.sided")
	P=wt$p.value
	ret=""
	if (P<0.05) ret="*"
	if (P<0.01) ret="**"
	return=ret
}

#theme_set(theme_bw())

theme_jack <- function (base_size = 12, base_family = "") {
    theme_bw(base_size = base_size, base_family = base_family) %+replace% 
        theme(
            #axis.text = element_text(colour = "white"),
            #axis.title.x = element_text(colour = "pink", size=rel(3)),
            #axis.title.y = element_text(colour = "blue", angle=45),
            #panel.background = element_rect(fill="green"),
            #panel.grid.minor.y = element_line(size=3),
            axis.text.x=element_text(size=8)
            ,panel.grid.major = element_line(colour = "grey")#,
           # plot.background = element_rect(fill="red")
           #,panel.grid = element_blank()
           ,panel.grid.major.x = element_blank() 
           #,axis.text.x = element_text(angle=90, vjust=0)



    )   
}
theme_set(theme_jack())

# data.size <- ddply(datatest2, .(genotype2), summarize, n=length(score), score=median(score)-0.1) ##"score" need to be calculated at the end, need to be named score
# data.size2<- ddply(datatest2, .(genotype2), summarize , star=Pvalue(score),score=median(score)+0.05)
# #data.size	

# p=ggplot(datatest2, aes(x=factor(datatest2$genotype2),y= score, fill= genotypefull2))
# p+ geom_boxplot()+ labs(x="genotype",y="PI during final test", title=title)+ ylim(-1.2, 1)+
# scale_fill_grey(start = 0.4, end = 1)



# p=ggplot(datatest2, aes(x=factor(genotype2),y= score, fill= genotype2))
 # p+ geom_boxplot()+ labs(x="genotype",y="PI during final test", title=title)+ ylim(-1.2, 1)+
 # scale_fill_grey(start = 0.4, end = 1)+ ##allow good bw prints
 

 # geom_text(aes(y= -1.1,label=paste("n =", n)), data=data.size) + geom_text(aes(label=paste(star)), data=data.size2) 
 
 data.size <- ddply(datatest2, .(shortname), summarize, n=length(score), score=median(score)-0.1) ##"score" need to be calculated at the end, need to be named score
data.size2<- ddply(datatest2, .(shortname), summarize , star=Pvalue(score),score=median(score)+0.05)


 p=ggplot(datatest2, aes(x=factor(shortname),y= score, fill= shortname))
 plot=p+ geom_boxplot()+ labs(x="genotype",y="PI during final test", title=title)+ ylim(-1.2, 1)+
 scale_fill_grey(start = 0.4, end = 1)+ ##allow good bw prints
 

 geom_text(aes(y= -1.1,label=paste("n =", n)), data=data.size) + geom_text(aes(label=paste(star)), data=data.size2) 
 
 # mm <- ddply(datatest2, "shortname", summarise, mmpg = mean(score))
# ggplot(mm, aes(x = factor(shortname), y = mmpg)) + geom_bar(stat = "identity")

#dev.off() 
datatest2$shortnamelegend <- factor(datatest2$shortnamelegend, levels = levels(datatest2$shortnamelegend)[neworder2])
 L=levels(datatest2$shortnamelegend)
 Lf=levels(datatest2$genotypefull2)
 text=""
 for (i in 1:length(L)){
 	text=paste(text,L[i],":",Lf[i], ".")
 }
 
text= paste("Full genotype of the flies tested is indicated below.",text)
sink("graph/legends.txt", append=TRUE)
cat("\n")
cat("\n")
cat(title)
cat("\n")
cat(text)
sink()
