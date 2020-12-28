library(pastecs)      # Libreria para la tabla de valores estadisticos
satelites<-read.table("satelites.txt")

Radio<-satelites$Radio
size_1<-length(Radio)

frec_abs_1<-table(Radio)
frec_abs_acum_1<-cumsum(frec_abs_1)
frec_rel_1<-table(Radio)/size_1
frec_rel_acum_1<-cumsum(frec_rel_1)

media_1<-mean(Radio)
minimo_1<-min(Radio)
maximo_1<-max(Radio)
rango_1<-range(Radio)
desv_tip_1<-sqrt((sd(Radio)^2)*(size_1-1)/size_1)
varianza_1<-(var(Radio)*(size_1-1))/size_1

mediana_1<-median(Radio)
cuart1_1<-quantile(Radio,0.25)
cuart2_1<-quantile(Radio,0.5)
cuart3_1<-quantile(Radio,0.75)
cuart4_1<-quantile(Radio,1)
cuant54_1<-quantile(Radio,0.54)

############################## PARTE 2 ###########################################
frecuencias_1<-data.frame(table(Radio))
frecuencias_1<-mutate(frecuencias_1,frec_abs_acum_1,frec_rel_1,frec_rel_acum_1)

tabla_1<-stat.desc(Radio)[c("mean","var","std.dev","range","median","min","max")]
names(tabla_1)<-c("Media","Varianza","Desviacion  tipica","Rango","Mediana","Minimo","Maximo")


cuantiles<-c(summary(Radio),cuant54_1)
cuantiles_1<-cuantiles[order(unlist(cuantiles))]