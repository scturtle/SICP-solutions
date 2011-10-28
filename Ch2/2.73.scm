(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp) (if (same-variable? exp var) 1 0))
	(else ((get 'deriv (operator exp)) (operands exp)
					   var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

; a) Above codes behave differently for different type of data(sum or product). number? and same-variable? cannot behave on list.

; b)
(define (deriv-sum opds var)
  (make-sum (deriv (car opds) var)
	    (deriv (cadr opds) var)))
(put 'deriv '+ deriv-sum)
(define (deriv-product opds var)
  (make-sum
    (make-product (car opds)
		  (deriv (cadr opds) var))
    (make-product (cadr opds)
		  (deriv (car opds) var))))
(put 'deriv '* deriv-product)

; c)
(define (deriv-exponentiation opds var)
  (make-product
    (cadr opds)
    (make-product
      (make-exponentiation (car opds) (- (cadr opds) 1))
      (deriv (car opds) var))))
(put 'deriv '** deriv-exponentiation)

; d)
; change args order for all the put called.
