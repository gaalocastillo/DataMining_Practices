install.packages('randomForest');
library('randomForest');

max = 20;
airquality.rf = randomForest(data=airquality[which(airquality$Ozone>0),],
                             Ozone~Wind+Temp,
                             ntree = 1000,
                             mtry = 1,
                             keep.forest = TRUE,
                             maxnodes = max);

airquality.rf;
win.graph(h=7, w=12, pointsize = 12);
par(mfrow = c(1,1));
partialPlot(airquality.rf, pred.data = airquality[which(airquality$Ozone>0),],
                                                  x.var = Wind);
points(y=airquality$Ozone, x=airquality$Wind);
plot(airquality.rf);
hist(treesize(airquality.rf));
varUsed(airquality.rf);
