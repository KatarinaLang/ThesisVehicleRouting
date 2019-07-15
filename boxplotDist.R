directory<-"~/Documents/Thesis/Benchmark_Instances/AllInstances/GH/"
setwd(directory)


temp<-list.files(pattern = ".TXT")
myfiles<-lapply(temp, read.csv)


distanceHub<-matrix(,nrow=1001,length(temp))
columnName<-matrix("", 1,length(temp))


for (i in 1:length(temp)) {
  nameInstance<-strsplit(temp[i], ".TXT")[[1]]
  columnName[1,i]<-c(nameInstance)
  instance<-read.csv(temp[i],header = TRUE, sep = "\t" )
  
  coordinatesHub<-head(instance,1)[2:3]
  
  for (j in 2:nrow(instance)) {
    coordinatesLocation<-instance[j,2:3]
    distanceHub[j,i]<-dist(rbind(coordinatesHub,coordinatesLocation))
  }
}
colnames(distanceHub)<-c(columnName)
boxplot(distanceHub, horizontal=TRUE, xlab="Distance from depot",ylim=c(0,350),las=1, cex.lab=2, main="Distance from depot per instance")
