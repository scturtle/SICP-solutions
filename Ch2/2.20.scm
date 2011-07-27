(define nil '())

(define (same-parity x . l)
  (define (foo x l)
    (cond
      ((null? l) nil)
      ((equal? (odd? x) (odd? (car l)))
       (cons (car l) (foo x (cdr l))))
      (else
	(foo x (cdr l)))))
  (foo x (cons x l)))


(display
  (same-parity 1 2 3 4 5 6 7))
