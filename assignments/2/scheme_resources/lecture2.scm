
;; Write our own version of MAP
;; (myMap f L) applies f to each element of L and returns a list of the results
;; Base case: L is empty, return the empty list (the problem size is the size of L)
;; Hypothesis: (myMap f (cdr L)) applies f to each element of (cdr L) and returns a list of the results.
;; Step: (myMap f L) returns (cons (f (car L)) (myMap f (cdr L))

(define (myMap f L)
  (cond ((null? L) '())
	(else (cons (f (car L))  (myMap f (cdr L))))))


