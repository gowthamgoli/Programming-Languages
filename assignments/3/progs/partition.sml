fun partition pivot nil = (nil, nil)
|	partition pivot (x::xs) = 
		let 
			val (lesser_Pivot, greater_Pivot) = partition pivot xs
		in
			if x < pivot then (x::lesser_Pivot, greater_Pivot)
			else (lesser_Pivot, x::greater_Pivot)
		end