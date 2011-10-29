(put '=zero? 'scheme-number
     (lambda (n) (= n 0)))

(put '=zero? 'rational
     (lambda (r)
       (and (= (numer r) 0)
	    (= (denom r) 0))))

(put '=zero? 'complex
     (lambda (c) (> 1e-6 (magnitude c))))
