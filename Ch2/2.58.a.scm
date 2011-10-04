(load "ch2.3.2.scm")

(define (make-sum a b) 
  (cond ((=number? a 0) b)
	((=number? b 0) a)
	((and (number? a) (number? b)) (+ a b))
	(else (list a '+ b))))

(define (make-product a b) 
  (cond ((or(=number? b 0) (=number? a 0)) 0)
	((=number? a 1) b)
	((=number? b 1) a)
	((and (number? a) (number? b)) (* a b))
	(else (list a '* b))))

(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))

(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))

(define (addend s) (car s))
(define (augend s) (caddr s))

(define multiplier addend)
(define multiplicand augend)

(display
  (deriv '(x + (3 * (x + (y + 2)))) 'x)
  )
(newline)

(display
  (deriv '((x + 3) * x) 'x)
  )
(newline)
