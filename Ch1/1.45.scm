(load "1.35.scm")
(load "1.43.scm")

;y^4=x
(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (root4 x)
  (fixed-point 
    ((repeated average-damp 2) 
     (lambda (y) (/ x (expt y 3)))) 1.0))

(display (root4 16.0))
(newline)

;y^n=x
(define (rootN x n)
  (let ((k (floor (/ (log n) (log 2)))))
    (format #t "x:~a n:~a k:~a ~%" x n k)
    (fixed-point 
      ((repeated average-damp k)
       (lambda (y) (/ x (expt y (- n 1))))) 1.0)))

(display (rootN 65535.0 16))
(newline)
