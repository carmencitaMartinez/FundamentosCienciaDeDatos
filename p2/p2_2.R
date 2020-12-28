library("Matrix")
library("arules")

frutas<- c("Frambuesa","Fresa","Naranja","Sandia","Melon");								#Creamos la lista de elementos                                     
datos<-scan("Frutas.csv",sep=";")											#Escaneamos el csv generado con el programa
matriz_datos<-Matrix(datos,ncol=length(frutas),nrow=50,byrow=T,sparse=T,dimnames=list(c(1:50),frutas));			#Convertimos la matriz
print(matriz_datos)													#Sacamos los datos por pantalla


asociacion<-apriori(as(t(as(matriz_datos,"nsparseMatrix")),"transactions"),parameter=list(support=0.2,confidence=0.6))	#Uso del algoritmo a priori

inspect(asociacion)

asociacion2<-eclat(as(t(as(matriz_datos,"nsparseMatrix")),"transactions"),parameter=list(support=0.2,maxlen=15))	#Tambien podemos ver el support con eclat, en lugar de apriori
inspect(asociacion2)