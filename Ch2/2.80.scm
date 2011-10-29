(put 'equ? '(scheme-number scheme-number)
     (lambda (n1 n2) (= n1 n2)))

(put 'equ? '(rational rational)
     (lambda (r1 r2)
       (and (= (numer r1) (numer r2))
	    (= (denom r1) (denom r2)))))

(put 'equ? '(complex complex)
     (lambda (c1 c2)
       (and (> 1e-6 (abs (- (angle c1) (angle c2))))
	    (> 1e-6 (abs (- (magnitude c1) (magnitude c2)))))))
