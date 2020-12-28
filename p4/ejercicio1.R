# Carga de la matriz de calificaciones
m<-matrix(c(4,4,3,5,1,2,5,5,0,1,2,2,4,5,2,1),2,8)
(m<-t(m))

# Carga de los centroides
centroides<-matrix(c(0,1,2,2),2,2)
(centroides<-t(centroides))

# Clasificación de las calificaciones con los centroides por k-means
(clasificacion<-kmeans(m,centroides,4))

# Extraemos el cluster de las clasificaciones y lo introducimos en la matriz de nuestros datos
(m=cbind(clasificacion$cluster,m))

# La mc1 cogerá la primera columna de todas las filas que tengan como valor 1
(mc1=subset(m,m[ ,1]==1)) 
# La mc2 cogerá la primera columna de todas las filas que tengan como valor 2
(mc2=subset(m,m[ ,1]==2))

# Reducimos las matrices mc1 y mc2, formadas por los valores del cluster a unicamente sus datos
(mc1=mc1[,-1])
(mc2=mc2[,-1])
