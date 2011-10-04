(define (equal? a b)
  (cond 
    ((and (null? a) (null? b)) #t)
    ((and (symbol? a) (symbol? b) (eq? a b)) #t)
    ((and (list? a) (list? b) (equal? (car a) (car b)) (equal? (cdr a) (cdr b))) #t)
    (else #f)))

(display
  (equal? '(a b c) '(a b c)))
