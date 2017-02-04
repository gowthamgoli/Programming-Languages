use "treedataType.sml";
Control.Print.printLength := 100;


fun Labels _ empty = nil
|	Labels _ (leaf v) = [v]
|	Labels _ (node(v, empty, empty)) = [v]
|	Labels traversal (node(v, left, empty)) = traversal (v, left, empty)
|	Labels traversal (node(v, empty, right)) = traversal (v, empty, right)
|	Labels traversal (node(v, left, right)) = traversal (v, left, right)

fun preorder (v, left, empty) = [v] @ (Labels preorder left)
|	preorder (v, empty, right) = [v] @ (Labels preorder right)
|	preorder (v, left, right) = [v] @ (Labels preorder left) @  (Labels preorder right)

fun inorder (v, left, empty) = (Labels inorder left) @ [v]
|	inorder (v, empty, right) = [v] @ (Labels inorder right)
|	inorder (v, left, right) = (Labels inorder left) @ [v] @ (Labels inorder right)

fun postorder (v, left, empty) = (Labels postorder left) @ [v]
|	postorder (v, empty, right) = (Labels postorder right) @ [v]
|	postorder (v, left, right) = (Labels postorder left) @ (Labels postorder right) @ [v]

