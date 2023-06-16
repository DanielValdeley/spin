mtype = {ack, data}

// Canais: mensagens formadas por tipo (data ou ack)
// e numero de sequencia (0 ou 1)
// Canal tx = vao do trans para rece (fluem quadros data)
// Canal rx = vao do rece para o trans (fluem quadros ack)
chan tx = [1] of {mtype, bit}
chan rx = [1] of {mtype, bit}

// protocolo nunca termina

active proctype transmissor() {
    bit seq = 0 // numero de sequencia atual
    bit num // numero de seqencia de msg recebida
    
    ocioso:
    do
    ::tx!data,seq -> // enviou data
      printf("transmissor transmitir msg %d\n", seq)
      goto espera
    ::
    od

    espera: // estado espera
    do
    ::rx?ack,num -> 
      if
      :: num == seq ->
         printf("transmissor recebeu ack %d\n", num)
         seq = ! seq
         goto ocioso
      :: else ->
         skip
      fi
    ::timeout -> 
        printf("retransmitiu data %d\n", seq)
        tx!data,seq
    od 
    
}

active proctype receptor() {
    bit seq = 0 // numero de sequencia atual
    bit num // numero de seqencia de msg recebida

    do
    ::tx?data,num -> 
      printf("receptor recebeu data %d, seq=%d", num, seq)
      rx!ack.num
      if 
      :: num == seq ->
        rx!ack,num
        seq = ! seq
      :: else ->
         skip
      fi
    od
}
