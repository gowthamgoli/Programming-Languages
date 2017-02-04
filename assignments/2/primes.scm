;; (primes n) returns the list of all primes less than or equal to n
;; which can be easily evaluated by calling (removeAllMults) on (2 3 . . . n)
;; Therefore, given 'n', we need to form the list (2 3 . . . n)

;; (increasing n) returns the list containing elements from 2 to n
;; Base Case  : If (n is 2) return '(2)'
;; Hypothesis : (increasing (-n 1)) returns the list (2 3 . . . n-1)
;; Recursive Step : Given the above hypothesis, (increasing n) = (append (increasing (- n 1)) (list n))


(load "removeAllMults.scm")

(define (increasing n)
  (cond ((= n 2) '(2))
        (else (append (increasing (- n 1)) (list n)))
  )
)

(define (primes n)
  (removeAllMults (increasing n))
) 