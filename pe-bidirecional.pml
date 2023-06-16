mtype = {ack, data}

// Canais: mensagens formadas por tipo (data ou ack) e 
// número de sequência (0 ou 1)
// Canal c1: bidirecional
// Canal c2: bidirecional
chan c1 = [1] of {mtype, bit}
chan c2 = [1] of {mtype, bit}

// protocolo nunca termina !

active proctype transmissor() {
  bit seq=0 // número de sequencia atual
  bit num

  ocioso: // estado ocioso
    c1!data,seq -> // enviou data
    printf("transmissor transmitiu msg %d\n", seq)

  espera: // estado espera
  do
  :: c2?ack,num -> // simula erro
     skip
  :: c2?ack,eval(seq) ->
      printf("transmissor recebeu ack %d\n", seq)
      seq = ! seq
      goto ocioso
  :: c2?ack,eval(!seq) ->
      printf("transmissor recebeu ack incorreto: %d\n", !seq)
      skip
  
  ::c2?data,num -> // simula erro
  

  :: timeout -> 
     printf("retransmitiu data %d\n", seq)
     c1!data,seq
  od
}

active proctype receptor() {
  bit seq=0 // número de sequencia atual
  bit num

  do
  :: c1?data,num -> // simula erro
     skip
  :: c1?data,eval(seq) ->
     printf("receptor recebeu data %d\n", seq)
     c2!ack,seq
     seq = ! seq
  :: c1?data,eval(!seq) ->
     printf("receptor recebeu data duplicado %d\n", !seq)
     c2!ack,!seq
  od
}

