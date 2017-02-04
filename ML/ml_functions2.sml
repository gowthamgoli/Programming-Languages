
fun length [] = 0
 |  length (y::ys) = 1 + length ys


fun map f [] = []
 |  map f (x::xs) = (f x) :: map f xs


fun compose f g = fn x => f(g x)

datatype stoplight = red | green | yellow

fun drive green = "go"
 |  drive red = "stop"
 |  drive yellow = "go faster"


datatype mytype = age of int | height of real

fun evaluate (age n) = if n > 40 then "you're old" else "you're young" 
 |  evaluate (height h) = if h > 6.0 then "you're tall" else "you're short"


datatype 'a tree = leaf of 'a | node of 'a tree * 'a tree;


fun fringe (leaf x) = [x]
 |  fringe (node (l,r)) = fringe l  @  fringe r

infix ++

fun x ++ y = x+(y*2)

