
(define (iterative-improve good-enough? improve)
  (lambda (x)
    (define (iter guess)
      (if (good-enough? guess)
	guess
	(iter (improve guess))))
    (iter x)))

(define tolerance 0.00001)

(define (sqrt-improve x first-guess)
  (define (good-enough? guess)
    (> tolerance (abs (- (* guess guess) x))))
  (define (average x y) (/ (+ x y) 2))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) first-guess))

(display
  (sqrt-improve 16 2.0))
(newline)

(define (fixed-point-improve f first-guess)
  (define (close-enough? guess)
    (> tolerance (abs (- guess (f guess)))))
  (define (improve guess) (f guess))
  ((iterative-improve close-enough? improve) first-guess))

(display
  (fixed-point-improve cos 1.0))
(newline)
