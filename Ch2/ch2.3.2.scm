(define variable? symbol?)

(define (same-variable? a b)
  (and (variable? a) (variable? b) (eq? a b)))

(define (make-sum a b) (list '+ a b))
(define (make-product a b) (list '* a b))

; better make-*

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-sum a b)
  (cond ((=number? a 0) b)
	((=number? b 0) a)
	((and (number? a) (number? b)) (+ a b))
	(else (list '+ a b))))

(define (make-product a b) 
  (cond ((or(=number? b 0) (=number? a 0)) 0)
	((=number? a 1) b)
	((=number? b 1) a)
	((and (number? a) (number? b)) (* a b))
	(else (list '* a b))))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (addend s) (cadr s))
(define (augend s) (caddr s))

(define multiplier addend)
(define multiplicand augend)

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
	(else
	  (error "unknown expression type -- DERIV" exp))))

;(display (deriv '(* (* x y) (+ 3 x)) 'x))
