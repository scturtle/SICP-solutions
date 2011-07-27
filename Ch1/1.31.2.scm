(use-modules (ice-9 debug))

(define (product f a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* (f a) result))))
  ;(trace iter)
  (iter a 1))

(define (f n)
  (let ((a (quotient n 2))
	(b (quotient (+ n 1) 2)))
    (/ (+ 2 (* b 2)) (+ 3 (* a 2)))))
	
(define (factorial n)
  (product f 0 (lambda (x) (+ x 1)) n))

(display (exact->inexact (* 4 (factorial 100))))
(newline)
