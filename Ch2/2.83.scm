(put 'raise 'ration
     (lambda (r)
       (make-from-real-imag (+ (numer r) (/ 1 (denom r))) 0)))
(put 'raise 'scheme-number
     (lambda (n)
       (make-rational n 1)))
(define (raise x) (apply-generic 'raise x))
