(define (first-term term-list)
  (make-term (- (length (cdr term-list) 1)) (car term-list)))

(define (adjoin-term term term-list)
  (if (=zero? (coeff term))
    term-list
    (let ((exponet (order term))
	  (max-list-exponet (- (length term-list) 1)))
      (cond ((= exponet max-list-exponet)
	     (cons (add (coeff term) (car term-list))
		   (cdr term-list)))
	    ((> exponet max-list-exponet)
	     (adjoin-term term (cons 0 term-list)))
	    ((< exponet max-list-exponet)
	     (cons (car term-list)
		   (adjoin-term term (cdr term-list))))))))

