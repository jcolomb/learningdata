
###do all analysis again. initialisation
#setwd("/Users/choupi/Desktop/boulot/FSdata")
#setwd("~/Gits/learningdata/flightdata/analysis_R/")
numberplot=0
sink("graph/legends.txt", append=FALSE)
cat("Text for figure legends")
cat("\n")
cat("\n")
sink()

##variables
subneg=6500
additional_text = " Both a positive and a negative control were tested in parallel with this experiment."
library(cowplot)


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

##comment for knitr

#P_8_2=P_8+theme(axis.text.x=element_text(size=6))
# 
# pdf("graph/results5.pdf", paper="a4")
# plot_grid(P_1, P_2, labels=c("A", "B","C","D"), ncol = 2, nrow = 2)
# plot_grid(P_4, P_6, labels=c("A", "B","C","D"), ncol = 2, nrow = 2)
# plot_grid(P_7, P_8,P_11, labels=c("A", "B","C","D"), ncol = 2, nrow = 2)
# plot_grid(P_3, P_5,P_9,P_10, labels=c("A", "B","C","D"), ncol = 2, nrow = 2)
# #grid.arrange(P_1, P_2,  ncol=2, nrow=2, left =textGrob("A"))
# #grid.arrange(P_4, P_6,  ncol=2, nrow=2)
# #grid.arrange(P_7, P_8,  ncol=2, nrow=2)
# 
# #grid.arrange(P_9,P_10, ncol=2, nrow=2)
# #grid.arrange(P_3, P_5,P_11,  ncol=2, nrow=2)
# dev.off()

