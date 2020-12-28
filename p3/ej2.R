# Ej 2.1
library(rpart)
library(rpart.plot)
library(C50)
alumnos = read.table("datos.txt")
alumnos

muestra = data.frame(alumnos)
muestra

clasificacion = rpart (curso~., data = muestra, method ="class",minsplit=1)
clasificacion
rpart.plot(clasificacion)

clasificacion = rpart (curso~., data = muestra, method ="poisson",minsplit=1)
clasificacion
rpart.plot(clasificacion)

clasificacion = rpart (curso~., data = muestra, method ="anova",minsplit=1)
clasificacion
rpart.plot(clasificacion)


alu <- vector(length = dim(muestra)[1])
alu[muestra$curso=="1"] <-"pr"
alu[muestra$curso=="2"] <-"sg"
alu[muestra$curso=="3"] <-"tr"
alu[muestra$curso=="4"] <-"cu"
muestra$curso <- factor(alu)

modelo = C5.0(curso~.,data = muestra)
summary(modelo)
plot(modelo)

# Ej 2.2
library(ggpubr)
alumnos = read.table("datos.txt")
alumnos
ggplot(alumnos, aes(x = asignaturas, y = curso)) +  geom_point() +  stat_smooth() + stat_smooth(colour="red", method = lm, se= FALSE)
cor(alumnos$asignaturas, alumnos$curso)