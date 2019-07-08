library(quantmod)

temp<-list.files(pattern = ".TXT")
myfiles<-lapply(temp, read.csv)


for (i in 1:length(temp)) {
  nameInstance<-strsplit(temp[i], ".TXT")[[1]]
  instance<-read.csv(temp[i],header = TRUE, sep = "\t" )
  assign(nameInstance, instance)
  
  instanceInfo<-matrix(0,1,11)
  colnames(instanceInfo)<-c("Name Instance", "Number of customers", "Peaks Demand","Average demand","SD Demand","Peaks Length time window","Average TW length", "SD TW length","Peaks distance from Hub", "Average Distance","SD Distance")
  instanceInfo[1]<-nameInstance
  #size of customer set, -1 for hub
  instanceInfo[2]<-nrow(instance)-1
  
  #demandPerCustomerPerInstance
  # assign(paste(nameInstance,"demand"),instance[["DEMAND"]])
  
  #number of peaks, distribution of Demand
  histogramObject <- hist(instance[["DEMAND"]])
  numberOfPeaks <- length(findPeaks(histogramObject$density))
  instanceInfo[3]<-numberOfPeaks
  instanceInfo[4]<-mean(instance[["DEMAND"]])
  instanceInfo[5]<-sd(instance[["DEMAND"]])
  
  ##peaks for distribution of distance from Hub
  coordinatesHub<-head(instance,1)[2:3]
  distancesHub<-matrix(0,1,nrow(instance))
  
  for (j in 2:nrow(instance)) {
    coordinatesLocation<-instance[j,2:3]
    distancesHub[1,j]<-dist(rbind(coordinatesHub,coordinatesLocation))
  }
 instanceInfo[9]<-length(findPeaks(hist(distancesHub)$density))
 instanceInfo[10]<-mean(distancesHub)
 instanceInfo[11]<-sd(distancesHub)
 
  
  ##peaks for distribution length of time window
  lengthsTW<-matrix(0,1,nrow(instance))
  for (k in 2:nrow(instance)) {
    lengthsTW[1,k]<-instance[k,6]-instance[k,5]
  }
  instanceInfo[6]<-length(findPeaks(hist(lengthsTW)$density))
  instanceInfo[7]<-mean(lengthsTW[1,2:length(lengthsTW)])
  instanceInfo[8]<-sd(lengthsTW[1,2:length(lengthsTW)])
  
  
  #assign final info to instance name
  assign(paste(nameInstance,"info"),instanceInfo)
  allInstances<-rbind(allInstances,c(instanceInfo))
}