(define (foo) (display "1"))

(define old-foo foo)

(define (foo) (begin (old-foo) (display "2") ))

(foo)
