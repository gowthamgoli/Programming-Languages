
;; Simple recursive function: factorial, (fac n)

;;  Base case: n=0, result is 1
;;  Hypothesis: fac works on any number smaller than n, e.g. n-1
;;  Recursive step:  fac n =  n * fac(n-1)

(define (fac n)
  (if (= n 0) 1 (* n (fac (- n 1)))))

;; version using COND

(define (fac n)
  (cond ((= n 0) 1) 
        (else (* n (fac (- n 1))))
	))

;;; (DECREASING N) creates a list (N N-1 N-2 ... 0)
;; Base case:  N=0, result is '(0)
;; Hypotheis: (DECREASING (- N 1)) returns (N-1 N-2 ... 0)
;; Recursive Step:  (DECREASING N) = (CONS N (DECREASING (- N 1)))

(define (decreasing n)
  (cond ((= n 0) '(0))
        (else (cons n (decreasing (- n 1))))))


;;; (APPEND L1 L2) returns a list containing all the elements of L1 and
;;; all the elements of L2.

;; Base Case: Size of L1 is 0 (empty list), return L2
;; Hypothesis: (APPEND L1' L2) will work as long as L1' contains 
;;             fewer elements than L1. So, let's assume
;;             (APPEND (CDR L1) L2) gives us all the elements of
;;             (CDR L1) and L@ in a list.
;; Recursive step: (APPEND L1 L2) = (CONS (CAR L1) (APPEND (CDR L1) L2))

(define (my_append L1 L2)
  (cond ((null? L1) L2)
        (else (cons (car L1) (my_append (cdr L1) L2)))
        ))


;;; (REVERSE L)  returns a list containing the elements of L but in 
;;; reverse order.

;; Base Case:  L is the empty list, '() the empty list
;; Hypothesis: (REVERSE (CDR L)) returns all the elements of L, 
;; except the first element of L, in reverse order.
;; Step:  (APPEND (REVERSE (CDR L)) (LIST (CAR L)))

(define (myReverse L)
  (cond ((null? L) '())
        (else (append (myReverse (cdr L)) (list (car L))))
        ))

;; Since above is O(n^2), here's a linear version


;; (REV FROM TO)  returns a list containing the elements of FROM in reverse order 
;;                followed by the elements of TO. 
;;                (Intuitively, FROM is the list of elements still to be reversed 
;;                and TO is a list of elements already in reverse order).
;; Base Case: If FROM is empty, then returning TO returns a list of the elements
;;            of FROM (there aren't any) in reverse order, followed by the elements
;;            of TO.
;; Hypothesis: Assume that (REV (CDR FROM) L), for any list L, will return a list 
;;             containing the elements of (CDR FROM) in reverse order followed by the 
;;             elements of L.
;; Recursive Step:  Given the above hypothesis, the value of (REV FROM TO), which should be
;;               the elements of FROM in reverse order followed by the elements of TO, can 
;;               be constructed by calling (REV (CDR FROM) (CONS (CAR FROM) TO) 
;;               which returns a list containing the elements of (CDR FROM) in reverse order,
;;               followed by the (CAR FROM) followed by the elements of TO.

(define (rev from to)
  (cond ((null? from) to)
        (else (rev (cdr from) (cons (car from) to)))))

;; Given the above definition, calling (REV L '()) will return a list containing
;; the elements of L in reverse order followed by the elements of '(), namely
;; the reverse of L.

(define (yourReverse L) (rev L '()))

