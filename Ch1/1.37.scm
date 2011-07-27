

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

(display (cont-frac2
	   (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   12))
