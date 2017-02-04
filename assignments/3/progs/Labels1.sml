use "treedataType.sml";
Control.Print.printLength := 100;

fun preorder empty = nil
|	preorder (leaf v) = [v]
| 	preorder (node(v, empty, empty)) = [v]
|	preorder (node(v, left, empty)) = [v] @ (preorder left)
|	preorder (node(v, empty, right)) = [v] @ (preorder right)
|	preorder (node(v, left, right)) = [v] @ (preorder left) @  (preorder right)

fun inorder empty = nil
|	inorder (leaf v) = [v]
| 	inorder (node(v, empty, empty)) = [v]
|	inorder (node(v, left, empty)) = (inorder left) @ [v]
|	inorder (node(v, empty, right)) = [v] @ (inorder right)
|	inorder (node(v, left, right)) = (inorder left) @ [v] @ (inorder right)

fun postorder empty = nil
|	postorder (leaf v) = [v]
| 	postorder (node(v, empty, empty)) = [v]
|	postorder (node(v, left, empty)) = (postorder left) @ [v]
|	postorder (node(v, empty, right)) = (postorder right) @ [v]
|	postorder (node(v, left, right)) = (postorder left) @ (postorder right) @[v]

fun Labels traversal tree = traversal tree
