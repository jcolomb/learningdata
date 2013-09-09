
###do all analysis again. initialisation
#setwd("/Users/choupi/Desktop/boulot/FSdata")
setwd("D:/dokumente/GitHub/learningdata/flightdata/analysis_R/")
numberplot=0
sink("graph/legends.txt", append=FALSE)
cat("Text for figure legends")
cat("\n")
cat("\n")
sink()

##variables
subneg=6500
additional_text = " Both a positive and a negative control were tested in parallel with this experiment."



##PKC gene
source("graph/mutant_analysis.r")
source("graph/RNAi53_inac.r")
source("graph/RNAi53_V_T.r")


###PKCi experiment

source("graph/mildHS.r")
source("graph/toostrongHS.r")
source("graph/HSelav.r")

source("graph/PKCi_nophenotype.r")
#source("graph/PKCi_phenotype.r")  ##both PKCi_d42_ok371.r and PKCi_exp16.r data together
source("graph/PKCi_d42_ok371.r")
source("graph/PKCi_exp16.r")  ##d42-c380 exp

source("graph/d42cha.r")

source("graph/GFPexp.r")  ##probably not for paper: UASGFP-> no phenotype


#P_8_2=P_8+theme(axis.text.x=element_text(size=6))
pdf("graph/results2.pdf", paper="a4")
grid.arrange(P_1, P_2, ncol=2, nrow=2)
grid.arrange(P_4, P_5,P_6, P_7)
grid.arrange(P_8, P_9,P_10, ncol=2)
dev.off()

#P_1+geom.line()
