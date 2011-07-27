
;(lambda (lambda (p q) p) ((lambda (p q) p) x y))

(define (cons x y)
  (lambda (m) (m x y)))

(define (cdr z)
  (z (lambda (p q) q)))
