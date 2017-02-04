abstract class Tree[T <: Ordered[T]]
case class Node[T <: Ordered[T]](v:T, l:Tree[T], r:Tree[T]) extends Tree[T]
case class Leaf[T <: Ordered[T]](v:T) extends Tree[T]


object max{

	def maxTree[T <: Ordered[T]](t: Tree[T]):T = t match{
		case Leaf(lb) => lb
		case Node(lb, left, right) => {
			if(lb >= maxTree(left) && lb >= maxTree(right)){
				lb
			}
			else if(maxTree(left) >= lb && maxTree(left) >= maxTree(right)){
				maxTree(left)
			}
			else
				maxTree(right)
		}

	}

	def test(){
		//val myBTree: Tree[Int] = Node(4, Node(2, Leaf(1), Leaf(3)), Node(6, Leaf(5), Leaf(7)))
		val myBTree: Tree[A] = Leaf(new A(5))
		//smaxTree(myBTree)
	}

	def main(args: Array[String]){
		test();
	}
}