;; (fromTo k n) returns the list of integers from k to n. The size
;;              of the problem can be seen as the difference between k and n.
;; Base Case :  If k = n (i.e. if the size of the problem is 0), then
;;              the result is the list containing only n.
;; Hypothesis : Assume (fromTo (+ k 1) n) returns the list of integers
;;              from k+1 to n.
;; Recursive step: (fromTo k n) = (cons k (FromTo (+ k 1) n)

(define (fromTo k n)
  (cond ((= k n) (list n))
        (else (cons k (fromTo (+ k 1) n)))
  )
)