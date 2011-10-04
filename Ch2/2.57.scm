(load "ch2.3.2.scm")

(define (augend s)
  (let ((right (cddr s)))
    (cond ((null? (cdr right)) (car right))
	  (else (cons '+ right)))))
(define (multiplicand s)
  (let ((right (cddr s)))
    (cond ((null? (cdr right)) (car right))
	  (else (cons '* right)))))

(display
  (deriv '(* x y (+ x 3)) 'x)
  )
