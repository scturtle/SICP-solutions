(load "1.43.scm")
(define dx 0.001)

(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(display (sin 3))
(newline)

(display 
  ((smooth sin) 3))
(newline)

(display 
  ((repeated (smooth sin) 3) 3))
(newline)
