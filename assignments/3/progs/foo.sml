fun foo f (op >) x (y,z) =
	let fun bar a = if x > z then y else a
	in bar [1,2,3]
	end