(use-modules (ice-9 debug))

(define (f x) (* x x x))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (simpson f a b n)
  (let ((h (/ (- b a) n)))
    (define (y k) (f (+ a (* k h))))
    (define (term k) 
	(+ (* 4 (y (- k 1)))
	   (* 2 (y k))))

    (/ (* h (+ (y 0) (sum term 1 (lambda (k) (+ k 2)) (- n 2)) (y n))) 3)))

(trace sum)
(display (exact->inexact (simpson f 0 1 100)))  (newline)
(display (exact->inexact (simpson f 0 1 1000))) (newline)
