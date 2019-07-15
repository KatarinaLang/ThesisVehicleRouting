  directory<-"~/Documents/Thesis/Benchmark_Instances/AllInstances/BC4/"
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
  par(mar=c(5,6,4,2))
  boxplot(distanceHub,las=1, main="Boxplot of distances from the hub per instance for algorithm BC4",horizontal=TRUE, xlab="Distance from hub",ylim=c(0,400))
  
  pvals<-matrix(,nrow=length(distanceHub[1,]),length(distanceHub[1,]))
  for(l in 1:15){
    for(m in (l+1):16){
      assign("w",wilcox.test(distanceHub[,m],distanceHub[,l]))
      
      pvals[l,m]<-as.character.numeric_version(w["p.value"])
    }
   
  }
