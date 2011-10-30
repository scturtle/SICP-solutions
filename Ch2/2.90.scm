(define (install-sparse-term-package)
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


  (define (the-empty-termlist) '())
  (define (rest-terms term-list) (cdr term-list))
  (define (empty-termlist? term-list) (null? term-list))

  (put 'first-term 'sparse-term-list
       (lambda (term-list) (attach-tag 'term (first-term term-list))))
  (put 'adjoin-term '(term sparse-term-list)
       (lambda (term term-list) (attach 'sparse-term-list (adjoin-term term term-list))))
  (put 'the-empty-termlist 'sparse-term-list
       (attach 'sparse-term-list (the-empty-termlist)))
  (put 'rest-terms 'sparse-term-list
       (lambda (term-list) (attach 'sparse-term-list (rest-terms term-list))))
  (put 'empty-termlist? 'sparse-term-list empty-termlist?)
  )

; do same things for dense-term-list
; ......

(define (first-term term-list) (apply-generic 'first-term term-list))
(define (adjoin-term term term-list) (apply-generic 'adjoin-term term term-list))
(define (the-empty-termlist) (get 'the-empty-termlist 'sparse-term-list))
(define (rest-terms term-list) (apply-generic 'rest-terms term-list))
(define (empty-termlist? term-list) (apply-generic 'empty-termlist? term-list))
(define (make-term order coeff) (attach 'term (list order coeff)))
(define (order term) (car term))
(put 'order 'term order)
(define (coeff term) (cadr term))
(put 'coeff 'term coeff)
