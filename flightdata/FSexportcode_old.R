#install.packages(c("plotrix", "MASS","vioplot", "UsingR","gplots","lattice","gdata","rfigshare"))

require(plotrix)
require(MASS)
require (vioplot)
require (UsingR)
require (gplots)
require (lattice)
require (gdata)
require (rfigshare)
#### experiment detail
setwd("/Users/choupi/Desktop/boulot/FSdata")

filenameprefix ="tubG_PKC_gal4_HS2h/tG80_PKCi_elav_"
datapoints <- 51

experimentid= "1_HS_test"
treatment ="HeatShock_37d_2h__RT1-4h"
experimentator = "Julien Colomb"
	##to determine by first uploading the data and check levels(data$genotype)
	# source("checkgenotype.r")
	
newnames= c("tubGal80ts/+;UAS-PKCi/+","elav-Gal4/+;tubGal80ts/+;UAS-PKCi/+","elav-Gal4/+","elav-Gal4/+;tubGal80ts/+;UAS-PKCi/+")

source("FSexportcode_common.r")
##specific
		data$treatment[data$genotype ==oldnames[4]] = "HeatShock_34d_2h__RT1-4h"

#write.csv (data, file="metafile.csv")
source("writemetafile.R")

####
#####

filenameprefix ="PKCmut_OUTC/PKCmut_OUTC_"
datapoints <- 67

experimentid= "2_PKC53emutant"
treatment ="none"
experimentator = "Julien Colomb"
	##to determine by first uploading the data and check levels(data$genotype)
	# source("checkgenotype.r")
	
newnames= c("PKC53mutant (outcrossed)","CS")

source("FSexportcode_common.r")
##specific
		#data$treatment[data$genotype ==oldnames[4]] = "HeatShock_34d_2h__RT1-4h"

#write.csv (data, file="metafile.csv")
source("writemetafile.R")

####
#####

filenameprefix =filenameprefix ="Foxp_dicer_25/Foxpdicer_"
datapoints <- 80

experimentid= "3_FoxPdicerRNAi"
treatment ="none"
experimentator = "Julien Colomb"
	##to determine by first uploading the data and check levels(data$genotype)
	source("checkgenotype.r")
	levels(data$genotype)= c(levels(data$genotype), "FoxP_CS")
data$genotype[data$genotype =="FoxP_E"]="FoxP_CS"
data$genotype[data$genotype =="FoxP_F"]="FoxP_elav"
data$genotype[data$genotype =="FoxP_Y"]="FoxP_d42"
data$genotype[data$genotype =="FoxP_Z"]="FoxP_elav"
#data$genotype[data$genotype =="FoxP_CS"]="FoxP_d42"
data=drop.levels(data)
data$genotype

	
newnames= c("UAS-dicer2/+;UAS-FoxpRNAi5020/+","UAS-dicer2/+;UAS-FoxpRNAi5020/+; d42-Gal4", "UAS-dicer2/elav-Gal4;UAS-FoxpRNAi5020/+")

source("FSexportcode_common.r")
##specific
		#data$treatment[data$genotype ==oldnames[4]] = "HeatShock_34d_2h__RT1-4h"

#write.csv (data, file="metafile.csv")
source("writemetafile.R")
###
### bjoerndata
experimentator = "Bjoern Brembs"
data = read.csv ("Foxp_dicer_25/bjoerndata.csv", header=TRUE)


source("bjoerndatatreatment.r")
####
#####

filenameprefix ="PKC53eRNAi/PKC53eRNAi_"
datapoints <- 68

experimentid= "4_PKC53_RNAi"
treatment ="Heatshock_32d_3days__25dfor30-90min"
experimentator = "Julien Colomb"
	##to determine by first uploading the data and check levels(data$genotype)
	 source("checkgenotype.r")
		data$genotype[data$genotype =="E"]="elavG4;tG80_RNAi_vienna"
data$genotype[data$genotype =="FALSE"]="elavG4;tG80_RNAi_Trip"
data$genotype[data$genotype =="G"]="CS_RNAi_vienna"
data$genotype[data$genotype =="H"]="CS_RNAi_Trip"
data$genotype[data$genotype =="I"]="elavG4;tG80_CS"
data$genotype= as.factor(data$genotype)
levels(data$genotype)

newnames= c("UAS_PKC53eRNAi_Trip/+","UAS_PKC53eRNAi_vienna/+","elavG4/+;tubGal80ts/+","elavG4/+;tubGal80ts/UAS_PKC53eRNAi_Trip","elavG4/+;tubGal80ts/+;UAS_PKC53eRNAi_vienna/+")

source("FSexportcode_common.r")
source("writemetafile.R")

####
#####

filenameprefix ="tubG_PKC_gal4_HSovernight/tG80_PKCi_elav_"
datapoints <- 29

experimentid= "5_HS_test"
treatment ="Heatshock_33d_15h__25dfor2-8h"
experimentator = "Julien Colomb"
	##to determine by first uploading the data and check levels(data$genotype)
	 source("checkgenotype.r")


newnames= c("elav-Gal4/+","elav-Gal4/+;UASPKCi/+;tubGal80ts/+","UASPKCi/+;tubGal80ts/+")

source("FSexportcode_common.r")
source("writemetafile.R")


####
#####

filenameprefix ="tubG_PKC_gal4_HS2h_36/tG80_PKCi_elav_"
datapoints <- 21

experimentid= "6_HS_test"
treatment ="Heatshock_36d_2h__25dfor1-4h"
experimentator = "Julien Colomb"
	##to determine by first uploading the data and check levels(data$genotype)
	 source("checkgenotype.r")


newnames= c("elav-Gal4/+","elav-Gal4/+;UASPKCi/+;tubGal80ts/+","UASPKCi/+;tubGal80ts/+")

source("FSexportcode_common.r")
source("writemetafile.R")
####
#####

filenameprefix ="tubG_PKC_gal4_HS4h_35/tG80_PKCi_elav_"
datapoints <- 37

experimentid= "7_HS_test"
treatment ="Heatshock_35d_4h__25dfor1-4h"
experimentator = "Julien Colomb"
	##to determine by first uploading the data and check levels(data$genotype)
	 source("checkgenotype.r")


newnames= c("elav-Gal4/+;UASPKCi/+;tubGal80ts/+","UASPKCi/+;tubGal80ts/+","elav-Gal4/+")

source("FSexportcode_common.r")
source("writemetafile.R")

####
#####

filenameprefix ="tubG_PKC_gal4_HS1h/tG80_PKCi_elav_"
datapoints <- 22

experimentid= "8_HS_test"
treatment ="Heatshock_37d_1h__25dfor1-4h"
experimentator = "Julien Colomb"
	##to determine by first uploading the data and check levels(data$genotype)
	 source("checkgenotype.r")

newnames= c("elav-Gal4/+;UASPKCi/+;tubGal80ts/+","elav-Gal4/+","UASPKCi/+;tubGal80ts/+")

source("FSexportcode_common.r")
source("writemetafile.R")

####
#####

filenameprefix ="mipkce/mipkc53e_"
datapoints <- 48

experimentid= "9_PKC53_putativemutant_mi"
treatment ="none"
experimentator = "Julien Colomb"
	##to determine by first uploading the data and check levels(data$genotype)
	 source("checkgenotype.r")

newnames= c("Mi_PKC53","Wtb")

source("FSexportcode_common.r")
data$laser.power = as.factor(as.numeric(data$laser.power *10000))
data$laser.power=suppressWarnings(as.numeric (as.character(data$laser.power)) )
source("writemetafile.R")

####
#####

filenameprefix ="Pinac/wtb_vs_Pinac_wminus_"
datapoints <- 39

experimentid= "10_PKCinac_putativemutant"
treatment ="none"
experimentator = "Julien Colomb"
	##to determine by first uploading the data and check levels(data$genotype)
	 source("checkgenotype.r")

newnames= c("Wtb", "w-;Pbac_PKCina")

source("FSexportcode_common.r")
data$laser.power = as.factor(as.numeric(data$laser.power *10000))
data$laser.power=suppressWarnings(as.numeric (as.character(data$laser.power)) )

insert= data.frame(rep("nocolor mode",nrow(data)),rep("blue",nrow(data)))
colnames(insert)= c("protocol", "color_when_positive")
x <-colnames(data) [1]
data= data.frame(data[,1],insert,data[,2:16], data[,19:length(data)])
x->colnames(data) [1]

source("writemetafile.R")


####
#####

filenameprefix ="pkcdelta/pkcdelta_"
datapoints <- 32  ##original 27 and 34 were erased

experimentid= "11_PKCdelta_putativemutant"
treatment ="none"
experimentator = "Julien Colomb"
	##to determine by first uploading the data and check levels(data$genotype)
	 source("checkgenotype.r")

newnames= c("Mi_PKCdelta","Wtb")

source("FSexportcode_common.r")
data$laser.power = as.factor(rep("20000",nrow(data)))
data$laser.power=suppressWarnings(as.numeric (as.character(data$laser.power)) )
source("writemetafile.R")

####
#####

filenameprefix ="foxp/foxp_"
datapoints <- 41

experimentid= "12_foxpmutant"
treatment ="none"
experimentator = "Julien Colomb"
	##to determine by first uploading the data and check levels(data$genotype)
	 source("checkgenotype.r")

newnames= c("foxp3955","CS_tz","foxp36019")

source("FSexportcode_common.r")
data$laser.power=as.factor(data$laser.power)
data$laser.power[1:13] = as.factor(rep("20000",13))
data$laser.power=drop.levels(data$laser.power)
data$laser.power=suppressWarnings(as.numeric (as.character(data$laser.power)) )
source("writemetafile.R")
####
#####

filenameprefix ="PKC53eMutant/PKC53emutant_"
datapoints <- 39

experimentid= "13_PKC53emutant"
treatment ="none"
experimentator = "Julien Colomb"
	##to determine by first uploading the data and check levels(data$genotype)
	 source("checkgenotype.r")

newnames= c("w-","w-;PKC53e-(redeyed)")

source("FSexportcode_common.r")


source("writemetafile.R")

####
#####

filenameprefix ="PKC53eMutant/PKC53emutant_"
datapoints <- 39

experimentid= "13_PKC53emutant"
treatment ="none"
experimentator = "Julien Colomb"
	##to determine by first uploading the data and check levels(data$genotype)
	 source("checkgenotype.r")

newnames= c("w-","w-;PKC53e-(redeyed)")

source("FSexportcode_common.r")


source("writemetafile.R")
####
#####

filenameprefix ="tubG_PKC_screen/tG80_PKCi_elav_"
datapoints <- 260

experimentid= "14_PKCi_screen"
treatment ="Heatshock_35d_4h__25dfor1-4h"
experimentator = "Julien Colomb"
	##to determine by first uploading the data and check levels(data$genotype)
	 source("checkgenotype.r")
	data = subset (data, data$genotype !="A")
	data = subset (data, data$genotype !="B") 
	data= drop.levels(data) 
	levels(data$genotype)
	 

newnames= c("elavGal4/+","OK371/+", "tubGal80ts/ ; UAS-PKCi/7y_Gal4,c819-Gal4","tubGal80ts/ ; UAS-PKCi/c232-Gal4")

source("FSexportcode_common.r")


source("writemetafile.R")
