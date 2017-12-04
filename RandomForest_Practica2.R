
df = iris[1:20,];
df = iris;
df;
unique(df$Species);
set.seed(123970);

#Tomo un numero de la fila 1 a la 150 y toma 100 aleatorios.
tr <- sample(1:150, 100);
iris.rf<-randomForest(data=df[tr,], 
                      ntree = 100, 
                      mtry = 2, 
                      nodesize = 1, 
                      Species~., 
                      importance=T);
iris.rf;

#Muestro la importancia de cada predictor.
iris.rf$importance;

plot(iris.rf);

#Verifico graficamente la importancia de los predictores.
varImpPlot(iris.rf);

#Utilizo el clasificador.
#Tomo como newdata al complemento del test en iris.
#Otros tipos de type es 'response'.
predict(iris.rf, newdata = iris[-tr,],
        type = "prob");

#El type 'response' muestra una unica prediccion ('prob' muestra probabilidades de
#tener una etiqueta)
table(iris$Species[-tr],
      predict(iris.rf, newdata = iris[-tr,],
              type = "response"));
