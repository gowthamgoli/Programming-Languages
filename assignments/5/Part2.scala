abstract class Tree[+T]

case class Node[T](lb:T, left:Tree[T], right:Tree[T]) extends Tree[T]

case class Leaf[T](lb:T) extends Tree[T]

trait Addable[T]{
	def +(other:T):T
}

class A(x:Int) extends Addable[A]{
	val value = x
	def get = x
	def +(other:A) = {
		val y = x+other.get
		val z = new A(y)
		z
	}
	override def toString(): String = "A("+x+")"
}

class B(x:Int) extends A(x:Int){
	override def toString(): String = "B("+x+")"
}

class C(x:Int) extends B(x:Int){
	override def toString(): String = "C("+x+")"
}

object Part2{

	def inOrder[T](t:Tree[T]):List[T] = t match {
		case Leaf(lb) => List(lb)
		case Node(lb, left, right) => inOrder(left) ++ List(lb) ++ inOrder(right) 
	}

	def treeSum[T <: Addable[T]](t:Tree[T]):T = t match{
		case Leaf(lb) => lb
		case Node(lb, left, right) => lb + (treeSum(left) + treeSum(right))
	}

	def treeMap[T,V](f:T=>V, t:Tree[T]):Tree[V] = t match{
		case Leaf(lb) => Leaf(f(lb))
		case Node(lb, left, right) => Node(f(lb), treeMap(f, left), treeMap(f, right))
	}

	def BTreeMap(f:B=>B, t:Tree[B]):Tree[B] = t match{
		case Leaf(lb) => Leaf(f(lb))
		case Node(lb, left, right) => Node(f(lb), treeMap(f, left), treeMap(f, right))
	}

	def test(){

		def faa(a:A):A = new A(a.value+10)
	    def fab(a:A):B = new B(a.value+20)
	    def fba(b:B):A = new A(b.value+30)
	    def fbb(b:B):B = new B(b.value+40)
	    def fbc(b:B):C = new C(b.value+50)
	    def fcb(c:C):B = new B(c.value+60)
	    def fcc(c:C):C = new C(c.value+70)
	    def fac(a:A):C = new C(a.value+80)
	    def fca(c:C):A = new A(c.value+90)

		val myBTree: Tree[B] = Node(new B(4),Node(new B(2),Leaf(new B(1)),Leaf(new B(3))), Node(new B(6), Leaf(new B(5)), Leaf(new B(7))))
    	val myATree: Tree[A] = myBTree

    	println("inOrder = " + inOrder(myATree))
    	println("Sum = " + treeSum(myATree))

    	//println(BTreeMap(faa,myBTree));		//Compile Error because faa is trying to assign an object of type A to type B
    	println(BTreeMap(fab,myBTree));
    	//println(BTreeMap(fba,myBTree));		//Compile Error because fba is trying to assign an object of type A to type B
    	println(BTreeMap(fbb,myBTree));
    	println(BTreeMap(fbc,myBTree));
    	//println(BTreeMap(fcb,myBTree));		//Compile Error because myBTree: Tree[B] and fcb takes a parameter of type C <: B
    	//println(BTreeMap(fcc,myBTree));		//Compile Error because myBTree: Tree[B] and fcc takes a parameter of type C <: B
    	println(BTreeMap(fac,myBTree));
    	println(BTreeMap(fca,myBTree));			//Compile Error because myBTree: Tree[B] and fca takes a parameter of type C <: B



    	println(treeMap(faa,myATree));
    	println(treeMap(fab,myATree));
    	//println(treeMap(fba,myATree));		//Compile Error because myATree: Tree[A] and fba takes a parameter of type B <: A 
    	//println(treeMap(fbb,myATree));		//Compile Error because myATree: Tree[A] and fbb takes a parameter of type B <: A 
    	//println(treeMap(fbc,myATree));		//Compile Error because myATree: Tree[A] and fbc takes a parameter of type C <: A 
 		//println(treeMap(fcb,myATree));		//Compile Error because myATree: Tree[A] and fcb takes a parameter of type C <: A
 		//println(treeMap(fcc,myATree)); 		//Compile Error because myATree: Tree[A] and fcc takes a parameter of type C <: A
 		println(treeMap(fac,myATree));			
 		//println(treeMap(fca,myATree));		//Compile Error because myATree: Tree[A] and fca takes a parameter of type C <: A

 		//In all the above errors we are either trying to pass 

	}
	def main(args: Array[String]){
		test();
	}
}