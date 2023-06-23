
int Tmax = 5

active proctype mef() {
    int t

    estatoDisk:
    do
    ::true -> goto statoPend
    ::true -> skip
    od

    estatoPend:
    do
    ::true -> skip
    ::true -> 
      t = 0
      goto estadoCon
    ::true -> goto estatoDisk
    od

    estadoCon:
    do
    :: true -> goto statoDisk
    :: t < Tmax ->
       t++
    od
}

ltl atend {<> call@con}
ltl nunca {[] !call@con}
ltl limite {! <> {call@con U (call:t > Tmax)}}