exception DivByZero
fun myMod x 1 = raise DivByZero
| myMod x y = x mod (y-1)