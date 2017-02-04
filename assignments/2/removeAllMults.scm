;; (removeMults L) returns the list containing those elements of L that are not
;;                 multiples of each other
;; Base Case       :  If the list is empty then the result is an empty list
;; Hypothesis      :  Let L' be (removeMults (car L) (cdr L)). Therefore L' contains all
;;		      the elements of (cdr L) that are not multiples of (car L)
;;		      Therefore (removeAllMults L') returns the list containing elements of (cdr L) that are not 
;;		      multiples of each other and also not multiples of (car L)
;; Recursive Step  :  Given the above hypothesis, the value of (removeAllMults L) can be evaluated by
;;	              appending (car L) to (removeMults L')
;;		      So (removeAllMults L) = (cons (car L) (removeAllMults L')) where L' = (removeMults (car L) (cdr L))

(load "removeMults.scm")
(define (removeAllMults L)
  (cond ((null? L) '())
        (else (cons (car L) (removeAllMults (removeMults (car L) (cdr L)))))
  )
)