(use-modules (ice-9 debug))

;2^a>0 2^b>0

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car z)
  (define (iter z)
    (if (not (= (remainder z 2) 0))
      0
      (+ 1 (iter (/ z 2)))))
  (trace iter)
  (iter z))

(define (cdr z)
  (define (iter z)
    (if (not (= (remainder z 3) 0))
      0
      (+ 1 (iter (/ z 3)))))
  (trace iter)
  (iter z))

(define z (cons 7 9))
(display z) (newline)
(display (car z)) (newline)
(display (cdr z)) (newline)
