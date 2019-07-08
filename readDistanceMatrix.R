#https://stackoverflow.com/questions/3081066/what-techniques-exists-in-r-to-visualize-a-distance-matrix

setwd("~/Downloads")
distanceMatrix <- read.csv("0627NWG-3.txt")
dist_m <- as.matrix(distanceMatrix)
dist_mi <- 1/dist_m # one over, as qgraph takes similarity matrices as input
library(qgraph)
jpeg('0627NWG-3.jpg', width=2000, height=2000, unit='px')
qgraph(dist_mi, layout='spring', vsize=3)
btw<-betweenness(as.igraph(qgraph(distanceMatrix), attributes=TRUE), directed = TRUE, weights = NULL, nobigint = TRUE, normalized = TRUE)
histobtw<-hist(btw[btw>0])
dev.off()