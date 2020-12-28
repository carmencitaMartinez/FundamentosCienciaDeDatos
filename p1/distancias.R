#Instalamos las librerias necesarias
install.packages("readxl")  #Lectura de ficher excel
install.packages("pastecs") #Realiza calculos (media, mediana, ...)
install.packages("dplyr")   #Mutate - concatencación de columnas

#Importamos las librerías instaladas previamente
library("readxl") 
library("pastecs")
library("dplyr")

# La función file.choose() abre un explorador de archivos
# que permite elegir el fichero Excel deseado
datosExcel<-read_excel(file.choose(),sheet="Hoja1")  
distancias<-datosExcel$dis
size_3<-length(distancias)

frec_abs_3<-table(distancias)
frec_abs_acum_3<-cumsum(frec_abs_3)
frec_rel_3<-table(distancias)/size_3
frec_rel_acum_3<-cumsum(frec_rel_3)

cuart1_3<-quantile(distancias,0.25)
cuart2_3<-quantile(distancias,0.5)
cuart3_3<-quantile(distancias,0.75)
cuart4_3<-quantile(distancias,1)
cuant54_3<-quantile(distancias,0.54)

frecuencias_3<-data.frame(table(distancias))
frecuencias_3<-mutate(frecuencias_3,frec_abs_acum_3,frec_rel_3,frec_rel_acum_3)

tabla_3<-stat.desc(distancias)[c("mean","var","std.dev","range","median","min","max")]
names(tabla_3)<-c("Media","Varianza","Desviacion  tipica","Rango","Mediana","Minimo","Maximo")


cuantiles<-c(summary(distancias),cuant54_3)
cuantiles_3<-cuantiles[order(unlist(cuantiles))]
cuantiles_3