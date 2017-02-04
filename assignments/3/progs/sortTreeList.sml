use "Labels.sml";
use "SortTree.sml";
use "lexLess.sml";

fun InorderTreesList nil = nil
|	InorderTreesList (x::xs) = (x, Labels inorder x)::InorderTreesList xs

fun Extract_Trees nil = nil
|	Extract_Trees ((tree, treeLabels)::trees) = tree :: Extract_Trees trees

fun sortTreeList (op <) nil = nil
|	sortTreeList (op <) (x::xs) = 
	let
		val trees_treeLabels = InorderTreesList (x::xs) 
		val trees_treeLabels_Sorted = SortTree (fn(a,b) => lexLess (op <) a b) trees_treeLabels
	in
		Extract_Trees trees_treeLabels_Sorted
	end