;; (removeMults m L)     returns the list containing all the elements
;;                       of L that are not multiples of m
;; Base Case        :    If the list is empty, then the result is an empty list
;; Hypothesis       :    Assume that (removeMults m (cdr L))) returns the list containing
;;                       all elements of (cdr L) that are not multiples of m
;; Recursive Step   :    Given the above hypothesis, the value of (removeMults m L) can be
;;                       constructed by checking if (car L) is a multiple of m.
;;                       If it is not a multiple of m, then add it to the list (removeMults m (cdr L))
;;                       If it is a multiple of m, then just return the list (removeMults (cdr L))

(define (removeMults m L)
  (cond ((null? L) '())
        ((= (modulo (car L) m) 0) (removeMults m (cdr L)))
        (else (cons (car L) (removeMults m (cdr L))))
  )
)  