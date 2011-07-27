(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (fast* a b)
  (define (iter a t b)
    (if (= b 1)
      (+ a t)
      (if (= b 0)
	0
	(if (even? b)
	  (iter (double a) t (halve b))
	  (iter a (+ t a) (- b 1) )))))
  (iter a 0 b))

(display (fast* 2 15))
(newline)
