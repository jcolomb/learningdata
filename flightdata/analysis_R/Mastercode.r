#setwd("./flightdata/analysis_R/")
#install.packages(c("plotrix", "MASS","vioplot", "UsingR","gplots","lattice","gdata","rfigshare"))

source("getdatafigshare.r")
#metafile$shortname

## need to put shortnames on figshare and get it back from there
## empty getdata.r, which is called in each sub-analysis

#IDshortname= fs_create (title="Names of the flies used in self-learning exp.",description="used to make good figures", type=("dataset"))
#fs_upload(IDshortname,"shortnames2.csv")

source("graph/doallanalysis.r")
