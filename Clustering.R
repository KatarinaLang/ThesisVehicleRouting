


#df<-`20181202EDV.1.distances`
#df1<-as.dist(df[1:50,1:50])
#db<-fpc::dbscan(df1, eps = 120, MinPts = 3, method = "dist", showplot = TRUE)

df<-`20181202EDV.2.distances`
df1<-as.dist(df)
db<-fpc::dbscan(df1, eps = 120, MinPts = 3, method = "dist", showplot = TRUE)

fviz_cluster(db,df, stand=FALSE, ellipse = TRUE, geom = "point")
dbcl<-db[["cluster"]]
dbclNull<-length(dbcl[dbcl==0])
dbclNotNull<-length(dbcl[dbcl!=0])
resultPercentage=dbclNull/(dbclNull+dbclNotNull)

#df<-`0706ALS.5.orders`[,2:3]
#db<-fpc::dbscan(df, eps = 0.004, MinPts = 20, method = "raw", showplot = TRUE)
#fviz_cluster(db,df, stand=FALSE, ellipse = TRUE, geom = "point")

#df<-as.matrix(C1_10_1[,2:3])
#db<-fpc::dbscan(df, eps = 45, MinPts = 12, method = "raw", showplot = TRUE, seeds = FALSE)

#df<-as.matrix(`20181126DHG.1.orders`[,2:3])
#db<-fpc::dbscan(df, eps = 0.005, MinPts = 24, method = "raw", showplot = TRUE, seeds = FALSE)

#df<-instance matrix
#df1 as.matrix(df)
#db<-fpc::dbscan(df2, eps = 10, MinPts = 40, scale=FALSE, method = "dist", seeds=TRUE, showplot = TRUE)
#fviz_cluster(db,df1,stand=FALSE,frame=FALSE,geom="point")
#plot.dbscan(db,df1)