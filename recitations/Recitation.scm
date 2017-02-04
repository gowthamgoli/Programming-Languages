;;Examples using the list keyword
(list 'a) 
(list 'a 'b 'c 'd 'e 'f) 
(list '(a b c) '2)          
(list '(a b c) '(d e f) '(g h i)) 

;;  Base case: n=0 result is 0 and n=1 results in 1
;;  Hypothesis: fib works on any number smaller than n, e.g. n-1
;;  Recursive step:  fib n =   fib(n-1) + fib(n-2)
(define (lfib n)
  (letrec ((fibo (lambda  (m x y)
              (cond ((= m 0) x)
                    ((= m 1) y)
                    (else (fibo (- m 1) y (+ x y)))))))
                                         
    
     (fibo n 0 1)
  )
)

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1)) (fib (- n 2))))))
		
;; Delete element at position i
;;  Base cases: L is null i.e is an empty list return nothing or i is 1 so return the rest of the list except the first element or length of the list is less than i then return the list
;;  Hypothesis: 
;;  Recursive step:  (deleteelement L i)=(cons (car L) (deleteelement (cdr L) (- i 1)))

(define (deleteelement L i)
  (cond ((null? L) null)
        ((= i 1) (cdr L))
        ((< (length L) i) L)
        (else (cons (car L) (deleteelement (cdr L) (- i 1))))))


(define (squareNN n)
  (cond ((= n 0) 0)
        (else (- (+ (squareNN (- n 1)) (* 2 n)) 1))))

;; search element in a list
;;  Base cases: L is null i.e is an empty list return false or the head of the list is the element you are searching for then return true
;;  Hypothesis: (member1 x (cdr L)) returns true if x is an element in the remaining of the list
;;  Recursive step: (member1 x L)= (member1 x (cdr L))

(define (member1 x L)
  (cond ((null? L) #f)
        (else (cond ((= x (car L)) #t)
                     (else (member1 x (cdr L)))))))
	
;; Below function is wrong! Why?	

(define (fac n)
	(cond ((= n 0) 1)
			(else n * (fac (- n 1)))))

;;  Base case: n=0, result is 1
;;  Hypothesis: fac works on any number smaller than n, e.g. n-1
;;  Recursive step:  fac n =  n * fac(n-1)			
(define (fac n)
	(cond ((= n 0) 1)
			(else (* n (fac (- n 1))))))

;; The function defined above and below are the same
(define fac
	(lambda (n)(cond ((= n 0) 1)
			(else (* n (fac (- n 1)))))))
			
;;Function to calculate the length of a list.
;;  Base case: list is empty then return 0
;;  Hypothesis: mylength (cdr l) returns the length of list l containing all elements of l except head of l
;;  Recursive step:  mylength n =  1 + mylength(cdr l)			

(define (mylength L)
	(cond ((null? l) 0)
		(else (+ 1 (mylength (cdr l))))))
		
(define (print L)
	(cond ((null? l) null)
		(else (cons(car L) (print (cdr l))))))


;;; (Merge L1 L2) returns a list containing all the elements of L1 and L2 in sorted order

;; Base Case: Size of L1 is 0 (empty list), return L2
;;			Size of L2 is 0 return L1
;; Hypothesis: If the first element of L1 is smaller than first element of L2
;;				then (Merge L1' L2) will work as long as L1' contains 
;;             fewer elements than L1. So, let's assume
;;             (Merge (CDR L1) L2) gives us all the elements of
;;             (CDR L1) and L2 in a list.
;;			Similarly if the first element of L1 is greater than first element of L2
;;				then (Merge L1 L2') will work as long as L2' contains 
;;             fewer elements than L2. So, let's assume
;;             (Merge L1 (CDR L2))  gives us all the elements of
;;             (CDR L2) and L1 in a list.
;;
;; Recursive step: (Merge L1 L2) = (CONS (CAR L1) (Merge (CDR L1) L2))
		
(define (merge l1 l2)
  (cond ((null? l1) l2)
        ((null? l2) l1)
        (else (if ( < (car l1) (car l2)) (cons (car l1) (merge (cdr l1) l2)) (cons (car l2) (merge l1 (cdr l2) ))))))


;;Wrong! Why?
(define (insertElem x l)
	(cond ((null? l) '(x))
		(else (cons (car l) (insertElem x (cdr l))))))
		
;;Inserting element at the end of the list		
;;  Base case: list is empty then return a list with just argument x as the element
;;  Hypothesis: insertElem x (cdr l) returns list where x as the last element 
;;  Recursive step:  insert x l = 	(insertElem x (cdr l))

(define (insertElem x l)
	(cond ((null? l) (cons x '()))
		(else (cons (car l) (insertElem x (cdr l))))))

;;Inserting element in a sorted list
;;  Base case 1: list is empty then return a list with just argument x as the element implying that x is the largest compared to the rest of the elements in the list
;;  Base case 2: x < head of the list implying we found a place where to place x. Return a list with x as the head of the new list and the rest of the elements are from l
;;  Hypothesis: insertElemInSortedList x (cdr l) returns list where x is part of the list
;;  Recursive step:  insertElemInSortedList x l = 	(insertElemInSortedList x (cdr l))
(define (insertElemInSortedList x l)
	(cond ((null? l) (cons x '()))
		((< x (car l)) (cons x l))
		(else (cons (car l) (insertElemInSortedList x (cdr l))))))

(define (getmax L m)
  (cond ((null? L) m)
        ((< m (car L)) (getmax (cdr L) (car L)))
        (else (getmax (cdr L) m))))

;;Instead of = , eq? could be used too
(define (replace L m n)
  (cond ((null? L) L)
        ((= (car l) m) (cons n (cdr l)))
        (else (cons (car l) ( replace (cdr L) m n))))  )

		
;;Works fine. x is created as a local variables.
 (let ((x 2))
  (+ x 3))

;; Below will throw an error
 (let ((x 2) (y (+ x 1)))
  (+ x y))

;;Works fine as the x is a global variable and the block in which it is assigned to y, global variable x is used  
   (define x 6)
 (let ((x 2) (y (+ x 1)))
  (+ x y))
 
 
  (let ((x 2) (y 3))
	(let ((z 5) (a (+ x y))) (+ z a) ))

;;Using let* helps get you around the problem of let	
(let* ((x 2) (y (+ x 1)))
  (+ x y))
 	
 
 '(+ 2 3)
 (symbol? 'hello)
 (symbol? '(1 2))

 (list? '(1 2))

 (list? (cons '1 '2))
 (list? '(1 . 2))
 (pair? '(1 . 2))

 ;;Map function takes 2 arguments, a function and a list. It then applies the function to every member of th list and return the result as a list 
 (map (lambda (x) (* 2 x)) '(1 -3 -5 7))
	 
;; Cons is a procedure	 
(map cons '(a b c) '(1 2 3))