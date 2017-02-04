fun reverse (nil)=nil
| reverse (x::xs) =reverse (xs) @ [x]