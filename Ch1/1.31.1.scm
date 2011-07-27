(use-modules (ice-9 debug))

(define (product f a next b)
  (if (> a b)
    1
    (* (f a) (product f (next a) next b))))

(define (f n)
  (let ((a (quotient n 2))
	(b (quotient (+ n 1) 2)))
    (/ (+ 2 (* b 2)) (+ 3 (* a 2)))))
	
(define (factorial n)
  (product f 0 (lambda (x) (+ x 1)) n))

;(trace product)
(display (exact->inexact (* 4 (factorial 100))))
(newline)
