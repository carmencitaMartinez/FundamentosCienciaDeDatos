install.packages("LearnClust")
install.packages("factoextra")
install.packages("xlsx")
install.packages("magick")
library(magick)
library(LearnClust)
library(tidyverse)
library(cluster)
library(factoextra)
library(xlsx)
library(gridExtra)
#Hemos profundizado en la representacion de los datos de dos maneras. Para ello hemos a�adido nuevos datos y hemos ampliado las categorias en las calificaciones.

#Leemos las calificaciones del fichero de texto
calificaciones<-read.table("calificaciones.txt")

#Omitimos todos los valores NA en caso de haberlos
calificaciones<-na.omit(calificaciones)

#Como no queremos que el algoritmo de agrupamiento dependa solo de una variable, estandarizamos los datos con scale
calificaciones<-scale(calificaciones)

#Calculamos una matriz de distancia entre las filas
distancia<-get_dist(calificaciones)

#Visualizamos la matriz de distancias
fviz_dist(distancia, gradient = list(low = "#FDFEFF", mid = "#84B5E6", high = "#020D6C"))


#Hacemos los distintos casos, variando las agrupaciones entre 1 y 4
k2 <- kmeans(calificaciones, centers = 1, nstart = 25)
k3 <- kmeans(calificaciones, centers = 2, nstart = 25)
k4 <- kmeans(calificaciones, centers = 3, nstart = 25)
k5 <- kmeans(calificaciones, centers = 4, nstart = 25)

#Guardamos las distintas graficas
p1<-fviz_cluster(k2, data = calificaciones) + ggtitle("k = 1")
p2<-fviz_cluster(k3, data = calificaciones) + ggtitle("k = 2")
p3<-fviz_cluster(k4, data = calificaciones) + ggtitle("k = 3")
p4<-fviz_cluster(k5, data = calificaciones) + ggtitle("k = 4")

#Hacemos un grid con las 4 graficas sacadas anteriormente
grid.arrange(p1, p2, p3,p4, nrow = 2)




#Pasamos ahora a probar el paquete de R: LearnClust:Hierarchical Clustering Algorithms


#Ponemos la matriz de ejemplo
matrizA<-c(4,4,3,5,1,2,5,5,0,1,2,2,4,5,2,1)

#Hacemos que sea de 2 columnas
matriz<-matrix(matrizA,ncol=2)

#Ahora convertimos la matriz
matriz<-data.frame(matriz)

#Usamos el Agglomerative Hierarchical Clusterization Algorithm
agglomerativeHC(matriz,'EUC','MAX')

#Para ver como se ha desarrollado el algoritmo anterior hemos usado la siguiente funcion
agglomerativeHC.details(matriz,'EUC','MAX')

#Usamos el Divisive Hierchical Clusterization Algorithm
divisiveHC(matrizA,'CHE','MIN')

#Para ver como se ha desarrollado el algoritmo anterior hemos usado la siguiente funcion
divisiveHC.details(matrizA,'CHE','MIN')

#Creamos el target y el weight, necesarios para este algoritmo
target<- c(2,3)
weight<- c(1,5)

#Usamos el Hierarchical Correlation Algorithm
correlationHC(matriz,target,weight)

#Para ver como se ha desarrollado el algoritmo anterior hemos usado la siguiente funcion
correlationHC.details(matriz,target,weight)