(use-modules (ice-9 debug))
(load "ch2.3.2.scm")

; "如果有+则为sum,如果只有*则为product" from http://panxz.blogbus.com/logs/29757995.html

(define (sum? x)
  (cond ((not (pair? x)) #f)
	((null? (cdr x)) #f)
	((eq? (cadr x) '+) #t)
	(else (sum? (cddr x)))))

(define (product? x)
  (cond ((not (pair? x)) #f)
	((null? (cdr x)) #f)
	((eq? (cadr x) '+) #f)
	(else 
	  (and (eq? (cadr x) '*)
	       (or (null? (cdddr x))
		   (product? (cddr x)))))))
;(trace product?)

;the left part of the first '+
(define (addend s)
  (define (iter left right)
    (if (eq? (car right) '+)
      left
      (iter (append left (list (car right) (cadr right))) (cddr right))))
  (if (eq? (cadr s) '+)
    (car s)
    (iter (list (car s) (cadr s) (caddr s)) (cdddr s))))

;the right part of the first '+
(define (augend s)
  (define (iter left right)
    (if (eq? (car right) '+)
      (cdr right)
      (iter (append left (list (car right) (cadr right))) (cddr right))))
  (let ((ans
    (if (eq? (cadr s) '+)
      (cddr s)
      (iter (list (car s) (cadr s) (caddr s)) (cdddr s)))))
    (if (null? (cdr ans))
    (car ans)
    ans)))


(define multiplier car)
(define (multiplicand exp)
  (let ((ans (cddr exp)))
    (if (null? (cdr ans))
    (car ans)
    ans)))

(define (make-sum a b) 
  (cond ((=number? a 0) b)
	((=number? b 0) a)
	((and (number? a) (number? b)) (+ a b))
	(else (list a '+ b))))
;(list a '+ b))

(define (make-product a b) 
  (cond ((or(=number? b 0) (=number? a 0)) 0)
	((=number? a 1) b)
	((=number? b 1) a)
	((and (number? a) (number? b)) (* a b))
	(else (list a '* b))))
;(list a '* b))

;(trace deriv)
(display
  ;(deriv '(x + (3 * (x + (y + 2)))) 'x)
  (deriv '(x + 3 * x + y + 2) 'x)
  )
