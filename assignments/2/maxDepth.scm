;; (maxDepth L) that returns the maximum nesting depth of any element within L
;; Base Case  : If L is an empty list then the maximum depth is 0
;;              If L is just a number, symbol etc (i.e atom) then the depth is -1
;;              as it is not a list (or it has 0 number of paranthesis)
;; Hypothesis : (maxDepth (cdr L)) returns the maximum nesting depth of any element
;;              within (cdr L) and (maxDepth (car L)) returns the maximum nesting depth of any
;;              any element within (car L)
;; Recursive Step : Let L be (L1 L2 . . . Ln) Therefore, (car L) = L1, (cdr L) = (L2 L3 . . . Ln)
;;                  Observe that (cdr L) has one extra pair of open-closed paranthesis than (car L)
;;                  because when we are referring to (car L) we traversed one level into the first enclosing paranthesis
;;                  Therefore, given the above Hypothesis, (maxDepth L) = (maximum (+ 1 (maxDepth (car L))) (maxDepth (cdr L)))

(define (maximum a b)
  (cond ((> a b) a)
        (else b)
  )
)

(define (atom? x)
  (and (not (null? x))
       (not (pair? x))))

(define (maxDepth L)
  (cond ((null? L) 0)
        ((atom? L) -1)
        (else (maximum (+ 1 (maxDepth (car L))) (maxDepth (cdr L))))
  )
)