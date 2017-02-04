use "partition.sml";

fun partitionSort [] = []
|	partitionSort [x] = [x]
|	partitionSort (x::xs) = 
		let
			val (lesser_x, greater_x) = partition x xs
		in
			(partitionSort lesser_x) @ [x] @ (partitionSort greater_x)
		end;