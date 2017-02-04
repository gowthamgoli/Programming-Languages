Control.Print.printDepth := 100;
datatype 'a tree = empty | leaf of 'a | node of 'a * 'a tree * 'a tree