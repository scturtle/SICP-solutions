(load "ch2.2.3.scm")
(define (count-leaves t)
  (accumulate +
	      0 
	      (map 
		(lambda (x)
		  (if (null? x)
		    0
		    (if (pair? x)
		      (count-leaves x)
		      1)))
		t)))

(define x '(1 (2 3) 4))
(display
  (count-leaves (list x x)))
