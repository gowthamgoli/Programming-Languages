;; (composition fns) takes a list of functions fns and returns a function
;; that is the composition of the functions in fns
;; Base Case : If the list contains only one function,then return that function
;; Hypothesis : Let fns be (f1 f2 . . . fn-1 fn) and fns' be (f1 f2 . . . (fn-1 (fn x))) then 
;;		(compposition fns') returns a function composition of the functions in L' i.e f1(f2(f3(. . . (fn-1(fn x)). . .)))
;; Recursive Step : Given the above hypothesis is true, now we need to evaluate the function (fn-1 (fn x)) and append this function to
;;		    (f1 f2 . . . fn-2) and call compose on this resulting list of functions
;;		    Let fnsR = (reverse fns) = (fn fn-1 fn-2 . . . f2 f1), Therefore (car fnsR) = fn, (cadr fnsR) = fn-1
;;	            (fn-1 (fn x)) = (compose (cadr fnsR) (car fnsR))
;;		    (f1 f2 . . . fn-2) = (reverse (cddr fnsR))
;;		    Therefore, (compose fns) = (compose (append (reverse (cddr fnsR)) (compose (cadr fnsR) (car fnsR))))

(define (compose f g) (lambda (x) (f (g x))))

(define (composition fns)
  (cond ((null? (cdr fns)) (car fns))
        (else (composition (append (reverse (cddr (reverse fns))) (list (compose (cadr (reverse fns)) (car (reverse fns)))))))
  )
)