(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (fast* a b)
  (if (= b 1)
    a
    (if (= b 0)
      0
      (if (even? b)
	(fast* (double a) (halve b))
	(+ a (fast* a (- b 1)))))))

(display (fast* 2 15))
