chan fila = [4] of {int}

active proctype produtor1() {
    int x = 1
 
    do
    :: x < 11 ->
       fila!x
       printf("Enviou %d\n",x)
       x++
    :: else -> break
    od
    printf("Produtor1 terminou.\n")
}

active proctype produtor2() {
    int x = 1
 
    do
    :: x < 11 ->
       fila!x
       printf("Enviou %d\n",x)
       x++
    :: else -> break
    od
    printf("Produtor2 terminou.\n")
}

active proctype consumidor() {
    int val

    do
    :: fila?val -> printf("Recebeu %d\n", val)
    :: timeout ->
       printf("Nada mais para receber ... saindo\n")
       break
    od
}
