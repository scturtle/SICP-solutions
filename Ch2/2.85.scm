(put 'project 'complex
     (lambda (x) (make-ration (real-part val))))
(put 'project 'rational
     (lambda (x) (make-scheme-number (numer val))))
(define (project x) (apply-generic 'project x))

(define (drop x)
  (let ((type (type-tag x))
	(val  (contents x)))
    (if (eq? 'scheme-number type)
      x
      (if (equ? (raise (project x)) x)
	(drop (project x))))))

; from 2.84.scm
(define (rank type)
  (cond ((eq? type 'scheme-number) 0)
	((eq? type 'rational) 1)
	((eq? type 'complex) 2)))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
	; modify here
	(drop (apply proc (map contents args)))
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
