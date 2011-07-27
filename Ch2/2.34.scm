(load "ch2.2.3.scm")

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) (+ this-coeff (* x higher-terms)))
              0
              coefficient-sequence))

(display
  (horner-eval 3 '(1 2 1)))
;3^2 + 2*3 + 1 = 16
