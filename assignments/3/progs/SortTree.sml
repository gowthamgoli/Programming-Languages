Control.Print.printLength := 100;

fun SortTree (op <) nil = nil
|	SortTree (op <) [x] = [x]
|	SortTree (op <) (x::xs) =
	let
		fun partition pivot nil = (nil, nil)
		|	partition pivot (y::ys) = 
				let
					val (tree_pivot, treeLabels_pivot)  = pivot
					val (tree_y, treeLabels_y)  = y
					val (lesser_Pivot, greater_Pivot) = partition pivot ys
				in
					if (treeLabels_y < treeLabels_pivot) then (y::lesser_Pivot, greater_Pivot)
					else (lesser_Pivot, y::greater_Pivot)
				end
		val (lesser_x, greater_x) = partition x xs 
	in
		(SortTree (op <) lesser_x) @ [x] @ (SortTree (op <) greater_x)
	end