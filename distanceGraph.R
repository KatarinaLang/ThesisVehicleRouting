#https://stackoverflow.com/questions/3081066/what-techniques-exists-in-r-to-visualize-a-distance-matrix

setwd("~/Downloads")
nba <- read.csv("0629ALS-1-distances.txt")
distanceMatrix<-dist(nba[1:50, -1], method = "euclidean", upper = TRUE)
dist_m <- as.matrix(distanceMatrix)
dist_mi <- 1/dist_m # one over, as qgraph takes similarity matrices as input
library(qgraph)
jpeg('R2_2_6_50Customers.jpg', width=2000, height=2000, unit='px')
qgraph(dist_mi, layout='spring', vsize=3)
dev.off()