install.packages("glmnet", repos = "http://cran.us.r-project.org")
install.packages("Matrix", repos = "http://cran.us.r-project.org")


library(tidyverse)
library(broom)
library(glmnet)
library(Matrix)

wd="myfolder/GB1_L1"
wd
setwd(wd)
#########
rules=read.table(file = 'rules.tsv', sep = '\t', header = FALSE)
response=read.table(file = 'response.tsv', sep = '\t', header = FALSE)[[1]]
seqlist=as.integer(unlist(read.table(file='seqlist.tsv',sep = '\t', header = FALSE)))

design <- sparseMatrix(rules[[1]],rules[[2]])
dim(design)


# Threeway L1
start_time <- Sys.time()

for (i in 1:18){
	for (j in 1:3){

tr=as.integer(unlist(read.table(file=paste('tr_',i,"_",j,".tsv",sep=''), header = FALSE)))
		
write.table(as.matrix(predict(cv.glmnet(design[tr,], response[tr],alpha=1), newx = design)), file=paste("pd_", i, "_", j, ".tsv", sep=""), quote=FALSE, sep='\t', col.names = NA)
		
	}
}
end_time <- Sys.time()

end_time - start_time


