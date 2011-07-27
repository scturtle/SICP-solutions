(use-modules (ice-9 debug))
(define (fib n)
  (define (iter a b k)
    (if (= k n)
      a
      (iter b (+ a b) (+ k 1))))
  (trace iter)
  (iter 0 1 0))
(display (fib 10))
