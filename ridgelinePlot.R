ridgeData1<-read.delim("~/Downloads/ridgeDataAverageLengthTW")
ggplot(ridgeData1, aes(y = Algorithm,x = Result,  fill = Result)) +geom_density_ridges() +theme_ridges() +  theme(legend.position = "none") + labs(x="Length of Time Window in average over all customers of one instance")

ridgeData3<-read.delim("~/Downloads/sizeInstances")
ggplot(ridgeData3, aes(y = Authors,x = customers,  fill = customers)) +geom_density_ridges() +theme_ridges() +  theme(legend.position = "none") + labs(x="Instance size", y="Algorithm")


ridgeData4<-read.delim("~/Downloads/ridgelinePlotPeaksTW")
ggplot(ridgeData4, aes(y = Authors,x = PeaksTW,  fill = PeaksTW)) +geom_density_ridges() +theme_ridges() +  theme(legend.position = "none") + labs(x="Number of peaks in distribution of time window length", y="Algorithm")




ridgeData4<-read.delim("~/Downloads/peaksDemand")
ggplot(ridgeData4, aes(y = Authors,x = PeaksDemand,  fill = PeaksDemand)) +geom_density_ridges() +theme_ridges() +  theme(legend.position = "none") + labs(x="Number of peaks in distribution of demand per customer", y="Algorithm")


ridgeData4<-read.delim("~/Downloads/AverageDistance")
ggplot(ridgeData4, aes(y = Authors,x = AverageDistance,  fill = AverageDistance)) +geom_density_ridges() +theme_ridges() +  theme(legend.position = "none") + labs(x="Average distance per instance from the hub, summed up over algorithms", y="Algorithm")

#ridgeData4<-read.delim("~/Downloads/PeaksDistanceHubBar")
ridgeData4<-read.csv("~/Downloads/PeaksDistanceHubRel",header = TRUE, sep = "\t", row.names = 1, )
ridgeData4Tr<-read.csv("~/Downloads/PeaksDistanceHubRelTrans",header = TRUE, sep = "\t", row.names = 1, )
#ggplot(ridgeData4, aes(y = Authors,x = PeaksDistanceHub,  fill = PeaksDistanceHub)) +geom_density_ridges() +theme_ridges() +  theme(legend.position = "none") + labs(x="Number of peaks in distribution of distance from the hub", y="Algorithm")
barplot(as.matrix(ridgeData4[,1:3]),beside = TRUE, legend=rownames(ridgeData4))
barplot(as.matrix(ridgeData4Tr[,1:12]),beside = TRUE, legend=rownames(ridgeData4Tr),xlab = "Algorithms",ylab = "Relative frequency of peaks", main = "Relative frequency of number of peaks in the distribution of distances from the hub per algorithm (all instances that are listed in the BKR)")