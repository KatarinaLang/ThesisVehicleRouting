directoryBC4<-"~/Documents/Thesis/Benchmark_Instances/AllInstances/BC4/"
directoryBSJ2<-"~/Documents/Thesis/Benchmark_Instances/AllInstances/BSJ2/"
directoryBVH<-"~/Documents/Thesis/Benchmark_Instances/AllInstances/BVH/"
directoryGH<-"~/Documents/Thesis/Benchmark_Instances/AllInstances/GH/"
directoryMB<-"~/Documents/Thesis/Benchmark_Instances/AllInstances/MB/"
directoryMB2<-"~/Documents/Thesis/Benchmark_Instances/AllInstances/MB2/"
directoryMBD<-"~/Documents/Thesis/Benchmark_Instances/AllInstances/MBD/"
directoryNBD<-"~/Documents/Thesis/Benchmark_Instances/AllInstances/NBD/"
directoryPGDR<-"~/Documents/Thesis/Benchmark_Instances/AllInstances/PGDR/"
directoryQ<-"~/Documents/Thesis/Benchmark_Instances/AllInstances/Q/"
directoryRP<-"~/Documents/Thesis/Benchmark_Instances/AllInstances/RP/"
directorySCR<-"~/Documents/Thesis/Benchmark_Instances/AllInstances/SCR/"
directoryVCGP<-"~/Documents/Thesis/Benchmark_Instances/AllInstances/VCGP/"




setwd("~/Downloads/InstanceSizeFolder/")
sizes<-read.csv("RelativeFrequenczOverall",header = TRUE, sep = "\t", row.names = 1, )
#sizes<-read.csv("FrequencySizePerSize",header = TRUE, sep = "\t", row.names = 1, )
#sizesTrans<-read.csv("RelativeFreqAlgosTransposed",header = TRUE, sep = "\t", row.names = 1 )
#sizesTrans<-read.csv("RelativeFrequenczOverall",header = TRUE, sep = "\t", row.names = 1 )
#barplot(as.matrix(sizesTrans[1,]), beside = TRUE, legend=rownames(as.matrix(sizesTrans[,])), xlab = "Instance size", ylab = "Relative frequency", col = c( "seashell1", "lightgoldenrod1",  "goldenrod3","lightsalmon", "red3", "plum1","skyblue1","darkseagreen1",  "turquoise", "blue1", "darkgreen", "grey25"))

barplot(as.matrix(sizes[,1:5]),beside = TRUE, xlab = "Overall", ylab = "Relative frequency", horiz = FALSE, col = c("lightgoldenrod1","lightsalmon", "plum1", "skyblue1",  "turquoise"), main = "Relative frequency of the instance size for each algorithm (all instances that are listed in the BKR)")


# setwd(directorySCR)
# 
# temp<-list.files(pattern = ".TXT")
# myfiles<-lapply(temp, read.csv)
# 
# sizeInstances=matrix(,length(temp),1)
# #columnName<-matrix("", 1,length(temp))
# 
# for (i in 1:length(temp)) {
#   nameInstance<-strsplit(temp[i], ".TXT")[[1]]
#   #columnName[1,i]<-c(nameInstance)
#   instance<-read.csv(temp[i],header = TRUE, sep = "\t" )
#     sizeInstances[i,1]<-nrow(instance)
# }
# colnames(sizeInstances)<-c(columnName)
# h1<-hist(sizeInstances, xlab="size instance",ylab="Frequency", breaks=10, xlim=c(0,1100))


# temp<-list.files(pattern = ".TXT")
# myfiles<-lapply(temp, read.csv)
# 
# sizeInstances2=matrix(,length(temp),1)
# #columnName<-matrix("", length(temp),1)
# 
# for (i in 1:length(temp)) {
#   nameInstance<-strsplit(temp[i], ".TXT")[[1]]
#   #columnName[i,1]<-c(nameInstance)
#   instance<-read.csv(temp[i],header = TRUE, sep = "\t" )
#   sizeInstances2[i,1]<-nrow(instance)
# }
# #colnames(sizeInstances2)<-c(columnName)
# #h2<-hist(sizeInstances2, col=rgb(0.5,0,0,1/4),xlab="size instance",ylab="Frequency", breaks=200, xlim=c(0,1200),add=T)
# 
# counts<-table(sizeInstances2[1:9,], sizeInstances)
# barplot(counts, col=c("darkblue", "red"),beside = TRUE, legend=rownames(counts))
#barplot(height = table(factor(sizeInstances, levels=min(sizeInstances):max(sizeInstances)))/length(sizeInstances),
 #       ylab = "proportion",
  #      xlab = "values",
   #     main = "histogram of x (proportions)")
