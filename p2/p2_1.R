datos<-read.transactions("datos.txt",sep=" ")				#Leer del txt que hemos generado
print(as(datos,"ngCMatrix"))
asociacion<-apriori(datos,parameter=list(support=0.5,confidence=0.8))	#Support=0.5 y Confidence=0.9
inspect(asociacion)