

// Illustrates the use of anonymous functions  (like Lambda expressions)
// The syntax is (parameters) => body. You'll generally need to wrap
// it in parentheses.

object lambdaExample {
  def higher(f: (Int) => Int) = f(f(3));
  
  def main(args: Array[String]) = println(higher((x) => x+1))
}

