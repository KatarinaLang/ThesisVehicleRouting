directory<-"~/Documents/Thesis/Benchmark_Instances/AllInstances/BC4/"
setwd(directory)

temp<-list.files(pattern = ".TXT")
myfiles<-lapply(temp, read.csv)

lengthsTW<-matrix(,nrow=1001,length(temp))
columnName<-matrix("", 1,length(temp))
#pdf("mb2.pdf")
for (i in 1:length(temp)) {
  nameInstance<-strsplit(temp[i], ".TXT")[[1]]
  columnName[1,i]<-c(nameInstance)
  instance<-read.csv(temp[i],header = TRUE, sep = "\t" )
  for (k in 2:nrow(instance)) {
    lengthsTW[k,i]<-instance[k,6]-instance[k,5]
  }
}
colnames(lengthsTW)<-c(columnName)
boxplot(lengthsTW, horizontal=TRUE, xlab="instance", ylab="Length of time window",ylim=c(0,5000))

wilcox.test(lengthsTW[,1],lengthsTW[,15])

#dev.off()