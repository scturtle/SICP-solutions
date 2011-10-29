(define (rank type)
  (cond ((eq? type 'scheme-number) 0)
	((eq? type 'rational) 1)
	((eq? type 'complex) 2)))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
	(apply proc (map contents args))
	(if (= (length args) 2)
	  (let ((type1 (rank (car type-tags)))
		(type2 (rank (cadr type-tags)))
		(a1 (car args))
		(a2 (cadr args)))
	    (cond ((= type1 type2)
		   (error "No method for these types"
			  (list op type-tags)))
		  ((< type1 type2)
		   (apply-generic op (raise t1) t2))
		  ((> type1 type2)
		   (apply-generic op t1 (raise t2)))))
	  (error "No method for these types"
		 (list op type-tags)))))))
