

(define (cont-frac n d k)
  (define (iter i)
  (if (= i k)
    (/ (n k) (d k))
    (/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 1))

(define (cont-frac2 n d k)
  (define (iter i ans)
  (if (= i 0)
    ans
    (iter (- i 1) (/ (n i) (+ (d i) ans)))))
  (iter k 0))

(define (d i)
  (if (= 0 (remainder (+ i 1) 3))
    (* 2 (quotient (+ i 1) 3))
    1))

(display (+ 2 (cont-frac2
	   (lambda (i) 1.0)
	   d
	   12)))
