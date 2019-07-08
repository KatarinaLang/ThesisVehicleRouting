library(xlsx)

allInstances <- matrix(0,1, 11)
colnames(allInstances)<-c("Name Instance", "Number of customers", "Peaks Demand","Average demand","SD Demand","Peaks Length time window","Average TW length", "SD TW length","Peaks distance from Hub", "Average Distance","SD Distance")


# setwd("~/Documents/Thesis/Benchmark_Instances/homberger_200_customer_instances/")
# source(file = "analyse.R")
# 
# setwd("~/Documents/Thesis/Benchmark_Instances/homberger_400_customer_instances/")
# source(file = "~/Documents/Thesis/Benchmark_Instances/homberger_200_customer_instances/analyse.R")
# 
# setwd("~/Documents/Thesis/Benchmark_Instances/homberger_600_customer_instances/")
# source(file = "~/Documents/Thesis/Benchmark_Instances/homberger_200_customer_instances/analyse.R")
# 
# setwd("~/Documents/Thesis/Benchmark_Instances/homberger_800_customer_instances/")
# source(file = "~/Documents/Thesis/Benchmark_Instances/homberger_200_customer_instances/analyse.R")
# 
# setwd("~/Documents/Thesis/Benchmark_Instances/homberger_1000_customer_instances/")
# source(file = "~/Documents/Thesis/Benchmark_Instances/homberger_200_customer_instances/analyse.R")

setwd("~/Instances/Orders/")
source(file = "~/Documents/Thesis/Benchmark_Instances/homberger_200_customer_instances/analysePicnic.R")

write.table(allInstances, "~/Documents/Thesis/resultsPicnic.txt", sep = "&", quote=FALSE)