(use-modules (ice-9 debug))

(define square (lambda (x) (* x x)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (let* ((a (expmod base (/ exp 2) m))
	        (a^2 (remainder (square a) m)))
	   (if (and (not (= a 1)) 
		    (not (= a (- m 1)))
		    (= a^2 1))
	     0
	     a^2)))
	(else
	  (remainder (* base (expmod base (- exp 1) m))
		     m))))

;(trace expmod)
;(display (expmod 11 10 2))

(define (mr-test? n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
	((mr-test? n) (fast-prime? n (- times 1)))
	(else #f)))

(display (fast-prime? 17 1)) (newline)
(display (fast-prime? 561 1)) (newline)
