install.packages("glmnet", repos = "http://cran.us.r-project.org")
install.packages("Matrix", repos = "http://cran.us.r-project.org")


library(tidyverse)
library(broom)
library(glmnet)
library(Matrix)


wd="myfolder/TF"
setwd(wd)

rules=read.table(file = 'designrules.tsv', sep = '\t', header = FALSE)
design <- sparseMatrix(rules[[1]],rules[[2]])
dim(design)

ABrules=read.table(file = 'ABrules.tsv', sep = '\t', header = FALSE)
AB <- sparseMatrix(ABrules[[2]],ABrules[[1]])

for (i in 1:){

tr=as.integer(unlist(read.table(file = paste('tr_',i-2,'.tsv',sep = ''),sep = '\t', header = TRUE)))
dat=read.table(file = paste('Es_',i,'.tsv',sep = ''),sep = '\t', header = TRUE)
response=AB%*% apply(dat,1,mean)

write.table(as.matrix(predict(cv.glmnet(design[tr,], response[tr],alpha=1), newx = design)), file=paste("pd3L1_", i, ".tsv", sep=""), quote=FALSE, sep='\t', col.names = NA)

}

