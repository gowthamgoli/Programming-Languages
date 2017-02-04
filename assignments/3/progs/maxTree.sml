use "treedataType.sml";
exception EmptyTree

fun maxTree (op <) empty = raise EmptyTree
|	maxTree (op <) (leaf v) = v
|	maxTree (op <) (node (v, left, empty)) =
	let
		val leftMax = maxTree (op <) left
	in
		if (leftMax < v) then v
		else leftMax
	end
|	maxTree (op <) (node (v, empty, right)) =
	let
		val rightMax = maxTree (op <) right
	in
		if (rightMax < v) then v
		else rightMax
	end
|	maxTree (op <) (node (v, left, right)) =
	let
		val leftMax = maxTree (op <) left
		val rightMax = maxTree (op <) right
	in
		if ((leftMax < v) andalso (rightMax < v)) then v
		else if ((v < leftMax) andalso (rightMax < leftMax)) then leftMax
		else rightMax
	end