#https://stackoverflow.com/questions/3081066/what-techniques-exists-in-r-to-visualize-a-distance-matrix

setwd("~/Downloads/Distances/Headers")

temp<-list.files(pattern = ".TXT")
myfiles<-lapply(temp, read.csv)


for (i in 1:length(temp)) {
  nameInstance<-strsplit(temp[i], ".TXT")[[1]]
  instance<-read.csv(temp[i],header = TRUE, sep = "," )
  
  btw<-betweenness(as.igraph(qgraph(instance), attributes=TRUE), directed = TRUE, weights = NULL, nobigint = TRUE, normalized = TRUE)
  assign(nameInstance,btw)
  write.table(btw,paste("~/Downloads/BetweennessCentrality/",nameInstance,".txt",sep = ""))
  #assign(nameInstance, instance)
}
  

#distanceMatrix <- read.csv("0627NWG-3.txt")
#dist_m <- as.matrix(distanceMatrix)
#dist_mi <- 1/dist_m # one over, as qgraph takes similarity matrices as input
#library(qgraph)
#jpeg('0627NWG-3.jpg', width=2000, height=2000, unit='px')
#qgraph(dist_mi, layout='spring', vsize=3)
#btw<-betweenness(as.igraph(qgraph(distanceMatrix), attributes=TRUE), directed = TRUE, weights = NULL, nobigint = TRUE, normalized = TRUE)
#histobtw<-hist(btw[btw>0])
#dev.off()