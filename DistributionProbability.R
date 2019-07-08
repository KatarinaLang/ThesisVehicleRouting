library(distr)

D<-DiscreteDistribution(supp = c(0,1,2,3,4), prob = c(0,0,6/16,7/16,3/16))
qd<-q(D)
pd<-p(D)