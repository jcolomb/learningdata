changename <- function(x,metafile){
	print(levels(metafile$genotype)[x])
	cat("give a new name")
newname= readLines(n=1)

levels(metafile$genotype)=c(levels(metafile$genotype),newname)
metafile$genotype[metafile$genotype==levels(metafile$genotype)[x]]=newname

}