
(define (double f)
  (lambda (x)
    (f (f x))))

(define (inc x) (+ x 1))

(display
  (((double (double double)) inc) 5))
  ;5 + 16 = 21 !!!!!!!!
(newline)
; = 
(display
  ((double (double (double (double inc)))) 5))
(newline)
