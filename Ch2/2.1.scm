(define (make-rat n d)
  (if (< d 0)
    (begin
      (set! d (- d))
      (set! n (- n))))
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat -1 -1))
(print-rat (make-rat  1 -1))
(print-rat (make-rat -1  1))
