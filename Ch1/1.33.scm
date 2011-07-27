
(load "prim.scm")

(define (accumulate combiner null-value term filtered a next b)
  (if (> a b)
    null-value
    (if (filtered a)
      (combiner (term a) (accumulate combiner null-value term filtered (next a) next b))
      (accumulate combiner null-value term filtered (next a) next b)
      )))

(define (accumulate2 combiner null-value term filtered a next b)
  (define (iter a result)
    (if (> a b)
      result
      (if (filtered a)
	(iter (next a) (combiner result (term a)))
	(iter (next a) result))))
  (iter a null-value))

(define (f x) x)
(define (next x) (+ x 1))

(define (primsum a b)
  (accumulate + 0 f prime? a next b))

(define (euler n)
  (define (test? i)
    (= (gcd i n) 1))
  (accumulate * 1 f test? 2 next n))

(display (primsum 1 10))
(newline)
(display (euler 10))
(newline)
