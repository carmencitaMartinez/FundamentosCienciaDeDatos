library(pastecs)
library(haven)
library(dplyr)
dataset <- read_sav("cardata.sav")

mpg<-dataset$mpg
mpg<-mpg[!is.na(mpg)]
size_2<-length(mpg)

frec_abs_2<-table(mpg)
frec_abs_acum_2<-cumsum(frec_abs_2)
frec_rel_2<-(table(mpg)/size_2)
frec_rel_acum_2<-cumsum(frec_rel_2)

media_2<-mean(mpg)
desv_tip_2<-sd(mpg)
var_2<-var(mpg)
minimo_2<-min(mpg)
maximo_2<-max(mpg)
rango_2<-range(mpg)
mediana_2<-median(mpg)

cuart1_2<-quantile(mpg,0.25)
cuart2_2<-quantile(mpg,0.5)
cuart3_2<-quantile(mpg,0.75)
cuart4_2<-quantile(mpg,1)
cuant54_2<-quantile(mpg,0.54)
########################## PARTE 2 ########################################
frecuencias_2<-data.frame(table(mpg))
frecuencias_2<-mutate(frecuencias_2,frec_abs_acum_2,frec_rel_2,frec_rel_acum_2)


tabla_2<-stat.desc(mpg)[c("mean","var","std.dev","range","median","min","max")]
names(tabla_2)<-c("Media","Varianza","Desviacion  tipica","Rango","Mediana","Minimo","Maximo")


cuantiles_2<-c(summary(mpg),cuant54_2)
cuantiles_2<-cuantiles_2[order(unlist(cuantiles_2))]