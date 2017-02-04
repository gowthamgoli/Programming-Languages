Control.Print.printLength := 100;

fun lexLess (op <) nil nil = false
|	lexLess (op <) nil (x::xs) = true
|	lexLess (op <) (x::xs) nil = false
|	lexLess (op <) [x] [y] = if x < y then true else false
|	lexLess (op <) (x::xs) (y::ys) = if (x < y) then true else if ((not (x < y)) andalso (not (y < x))) then lexLess (op <) xs ys else false