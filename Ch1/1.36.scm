(use-modules (ice-9 format))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (format #t "guess:~a~%" guess)
    (let((next (f guess)))
      (if (close-enough? guess next)
	next
	(try next))))
  (try first-guess))

(define (average a b)
  (/ (+ a b) 2.0))

(display (fixed-point (lambda (x) (average x (+ 1 (/ x)))) 1.0))
(newline)

(display (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2.0))
(newline)

(display (fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0))
(newline)
