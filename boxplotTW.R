directory<-"~/Documents/Thesis/Benchmark_Instances/AllInstances/RP/"
setwd(directory)


temp<-list.files(pattern = ".TXT")
myfiles<-lapply(temp, read.csv)


lengthTW<-matrix(,nrow=1001,length(temp))
columnName<-matrix("", 1,length(temp))


for (i in 1:length(temp)) {
  nameInstance<-strsplit(temp[i], ".TXT")[[1]]
  columnName[1,i]<-c(nameInstance)
  instance<-read.csv(temp[i],header = TRUE, sep = "\t" )
  
  for (j in 2:nrow(instance)) {
    lengthTWInstance<-instance[j,6]-instance[j,5]
    lengthTW[j,i]<-lengthTWInstance
  }
}
colnames(lengthTW)<-c(columnName)
par(mar=c(5,6,4,2))
boxplot(lengthTW,las=1, main="Boxplot of time window length per instance for algorithm BC4",horizontal=TRUE, xlab="Length of time window",ylim=c(0,1500))

pvals<-matrix(,nrow=length(lengthTW[1,]),length(lengthTW[1,]))
for(l in 1:3){
  for(m in (l+1):4){
    assign("w",wilcox.test(lengthTW[,m],lengthTW[,l]))
    
    pvals[l,m]<-as.character.numeric_version(w["p.value"])
  }
  
}
