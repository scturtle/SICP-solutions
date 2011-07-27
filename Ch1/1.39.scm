(use-modules (ice-9 format))

(define (tan-cf x k)
  (define (n i)
    (if (= i 1) x (* x x)))
  (define (d i)
    (- (* i 2) 1.0))
  (define (iter i ans)
    (format #t "i:~a n:~a d:~a ans:~a ~%" i (n i) (d i) ans)
    (if (= i 0)
      ans
      (iter (- i 1) (/ (n i) (- (d i) ans)))))
  (iter k 0))

(display (tan-cf (/ 3.14 4) 10))
