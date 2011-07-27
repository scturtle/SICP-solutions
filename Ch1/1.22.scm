(use-modules (srfi srfi-19)) ;time
(use-modules (ice-9 debug))

(load "prim.scm")

(define (runtime) (time-nanosecond (current-time)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes n count)
  (if (not (= count 0))
    (if (prime? n)
      (begin
	(timed-prime-test n)
	(search-for-primes (+ n 1) (- count 1)))
      (search-for-primes (+ n 1) count))))

;(trace search-for-primes)
(search-for-primes 1000 3)
(newline)
(search-for-primes 10000 3)
(newline)
(search-for-primes 100000 3)
(newline)
