(load "2.36.scm")

(define v '(1 2 3))
(define w '(1 2 3))
(define m '((1 2 3) (3 4 5) (4 5 6) (7 8 9)))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(display (dot-product v w))
(newline)

(define (matrix-*-vector m v)
  (map (lambda (w) (dot-product w v)) m))

(display (matrix-*-vector m v))
(newline)

(define (transpose m)
  (accumulate-n cons '() m))

(display (transpose m))
(newline)

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (r) (matrix-*-vector cols r))  m)))

(display (matrix-*-matrix m (transpose m)))
(newline)
