import random

def generarFrutas(numSucesos):
    f = open ("Frutas.csv","w")
    for i in range(1,numSucesos+1):
        aleatorio= random.randint(0,63)
        res=list(map(int,bin(aleatorio)[2:].zfill(6)))
        linea = "{0};{1};{2};{3};{4};{5}\n"
        f.write(linea.format(res[0],res[1],res[2],res[3],res[4],res[5]))
    f.close()


generarFrutas(100)
