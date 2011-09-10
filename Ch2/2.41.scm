(load "2.40.scm")

(define (triple n)
  (flatmap (lambda (i)
	 (map (lambda (s) (append s (list i)))
	      (unique-pairs (- i 1))))
       (enumerate-interval 1 n)))

(display
  (triple 6)
  )
(newline)

(define (sum-checker s)
  (lambda (seq) (= s (accumulate + 0 seq))))

(display
  (filter (sum-checker 10) (triple 6))
  )
(newline)
