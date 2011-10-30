(put '=zero? 'polynomial
     (lambda (x)
       (define (check ts)
	 (cond ((null? ts) #t)
	       ((not (=zero? (coeff (car ts)))) #f)
	       (else (check (cdr ts)))))
       (check (term-list x))))
