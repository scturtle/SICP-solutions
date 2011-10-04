(load "ch2.3.2.scm")

(define (make-exponentiation a b)
  (cond ((=number? b 0) 1)
	((=number? b 1) a)
	(else (list '** a b))))

(define (exponentiation? expo)
  (and (pair? expo) (eq? (car expo) '**)))
(define (base expo) (cadr expo))
(define (exponent expo) (caddr expo))

(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp)
	 (if (same-variable? exp var) 1 0))
	((sum? exp)
	 (make-sum (deriv (addend exp) var)
		   (deriv (augend exp) var)))
	((product? exp)
	 (make-sum
	   (make-product (multiplier exp)
			 (deriv (multiplicand exp) var))
	   (make-product (deriv (multiplier   exp) var)
			 (multiplicand exp))))
	((exponentiation? exp)
	 (make-product
	   (exponent exp)
	   (make-product
	     (make-exponentiation (base exp) (- (exponent exp) 1))
	     (deriv (base exp) var))))
	(else
	  (error "unknown expression type -- DERIV" exp))))

(display (deriv '(** a 5) 'a))
