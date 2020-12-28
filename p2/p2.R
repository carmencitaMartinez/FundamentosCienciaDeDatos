install.packages("arules")
library(arules)
muestra<-Matrix(c(1,1,0,1,1, 1,1,1,1,0, 1,1,0,1,0, 1,0,1,1,0, 1,1,0,0,0, 0,0,0,1,0),
			 6,5, byrow=TRUE,
			 dimnames=list(c("Suceso 1","Suceso 2","Suceso 3","Suceso 4","Suceso 5","Suceso 6"),
						 c("Pan","Agua","Café","Leche","Narajas")),
			 sparse=TRUE)
muestrangcCMatrix<-as(muestra, "nsparseMatrix")
transpmuestrangcMatrix<-t(muestrangcCMatrix)
transacciones<-as(transpmuestrangcMatrix,"transactions")
summary(transacciones)
asociaciones<-apriori(transacciones, parameter=list(support=0.5, confidence=0.8))
asociaciones
inspect(asociaciones)