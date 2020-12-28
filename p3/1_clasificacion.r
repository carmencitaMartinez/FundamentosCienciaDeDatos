library('ggplot2')
library('rpart')
library("rpart.plot")

#Leemos el archivo
calificaciones <- read.table("./calificaciones.txt")

#Visualizamos las calificaciones
print(calificaciones)

#Convertimos el archivo a dataframe
muestra <- data.frame(calificaciones)

#Utilizamos la funcion rpart
clasificacion <- rpart(Calificacion~., data=muestra, method="class", minsplit=1)

#Visualizamos el gini, usado por defecto en rpart
print(clasificacion)

#Dibujamos con la funcion rpart.plot la grafica
rpart.plot(clasificacion)

#Cargamos los datos de los planetas
planetas<-read.table("./planetas.txt")

#Convertimos a dataframe
planetas<-data.frame(planetas)

#Hacemos el calculo de la regresion
regresion<-lm(D~R,data=planetas)
ggplot(planetas, aes(x = D, y = R)) +   geom_point(color='blue') +   geom_smooth(method = "lm", se = FALSE)

