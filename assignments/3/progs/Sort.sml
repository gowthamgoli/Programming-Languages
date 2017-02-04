Control.Print.printLength := 100;

fun Sort (op <) nil = nil
|	Sort (op <) [x] = [x]
|	Sort (op <) (x::xs) =
	let
		fun partition pivot nil = (nil, nil)
		|	partition pivot (y::ys) = 
				let
					val (lesser_Pivot, greater_Pivot) = partition pivot ys
				in
					if (y < pivot) then (y::lesser_Pivot, greater_Pivot)
					else (lesser_Pivot, y::greater_Pivot)
				end
		val (lesser_x, greater_x) = partition x xs 
	in
		(Sort (op <) lesser_x) @ [x] @ (Sort (op <) greater_x)
	end