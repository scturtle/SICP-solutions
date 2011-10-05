(load "define-test.scm")

(define old-foo foo)

(define (foo) (begin (old-foo) (display "2") ))

(foo)
