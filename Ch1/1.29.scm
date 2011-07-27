(use-modules (ice-9 debug))

(define (f x) (* x x x))

(define (simpson f a b n)
  (let ((h (/ (- b a) n)))
    (define (y k) (f (+ a (* k h))))
    (define (iter k)
      (if (= k 0)
	(y 0)
	(+ (* 4 (y (- k 1)))
	   (* 2 (y k))
	   (iter (- k 2)))))
    (/ (* h(- (iter n) (y n))) 3)))

(display (exact->inexact (simpson f 0 1 100)))  (newline)
;(display (exact->inexact (simpson f 0 1 1000))) (newline)
