(load "2.38.scm")

(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) '() sequence))

(display (reverse '(1 2 3)))
(newline)

(define (reverse sequence)
  (fold-left (lambda (x y) (cons y x)) '() sequence))

(display (reverse '(1 2 3)))
