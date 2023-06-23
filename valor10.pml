int count;
bool incr;

active proctype counter() {
    do
    :: incr && count < 10 -> 
        count++
        incr = false
    :: count == 10 -> count = 0
    od
}

active proctype env() {
  do
  :: !incr -> incr = true
  od
}

// 1
ltl formula {<> (count == 10)} 

// 2
ltl repete {[]<> (count == 10)}

// 3
ltl justica {[]<> (_last == env:_pid)}