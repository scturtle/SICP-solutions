(define (div-interval x y)
  (if (>= 0 (* (upper-bound y) (lower-bound y)))
    (display "ERROR")
    (mul-interval x
		  (make-interval (/ 1.0 (upper-bound y))
				 (/ 1.0 (lower-bound y))))))
