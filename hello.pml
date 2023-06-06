chan canal1 = [1] of {int}
chan canal2 = [1] of {int}

active proctype p1() {
  int msg1, msg2

  do
  :: canal1?msg1 -> printf("Recebeu msg1=%d\n", msg1)
  :: canal2?msg2 -> printf("Recebeu msg2=%d\n", msg2)
  od

}

active proctype p2() {
  
  do
  :: canal1!111 -> printf("Enviei 111")
  :: canal2!222 -> printf("Enviei 222")
  :: else -> break
  od
  
 }
