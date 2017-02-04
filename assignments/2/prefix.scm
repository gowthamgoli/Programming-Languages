;; (prefix exp)   transforms an infix arithmetic expression exp into prefix notation
;; Base Case  :   If the exp is a list containing only a single number (i.e atom), return the number
;; Hypothesis :   (prefix (car exp)) transforms (car exp) into prefix notation
;;                (prefix (list (car exp))) transforms (list (car exp)) into prefix notation and 
;;                (prefix (cddr exp)) transforms (cddr exp) into prefix notation
;; Recursive Step : Given the above hyopthesis is true,
;;                  Let i) exp = (exp1 operator exp2) then (car exp) = exp1, (cadr exp) = operator
;;                  and(cddr exp) = (exp2), then in the prefix notation the exp will be (operator (prefix (exp1)) (prefix (exp2)))
;;                  i.e (prefix exp) = (list (cadr exp) (prefix (list (car exp))) (prefix (cddr exp)))
;;
;;                  ii) exp = ((exp1)) (i.e (cdr exp) is null and (car exp) is not an atom, 
;;		    then (prefix exp) = (prefix (exp1)) = (prefix (car exp))

;;		    Thus we have two cases for (prefix exp) as defined above

(define (atom? x)
  (and (not (null? x))
       (not (pair? x))))

(define (prefix L)
  (cond ((and (atom? (car L)) (null? (cdr L))) (car L))
        ((and (not (atom? (car L))) (null? (cdr L))) (prefix (car L)))
        (else (list (cadr L) (prefix (list (car L))) (prefix (cddr L))))
  )
)