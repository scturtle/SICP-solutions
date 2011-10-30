(put 'inv 'polynomial
     (lambda (x)
       (define (temp ts)
	 (cond ((null? ts)
		'())
	       (cons (make-term (order (car ts)) 
				(inv (coeff (car ts)))))))
       ((temp (term-list x)))))

(define (inv x) (apply-generic 'inv x))

(put 'minus '(polynomial polynomial)
     (lambda (p1 p2)
       (add-poly p1 (inv p2))))

(define (minus x) (apply-generic 'minus x))
