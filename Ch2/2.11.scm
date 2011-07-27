(define (mul-interval x y)
  (let ((lx (lower-bound x))
	(ux (upper-bound x))
	(ly (lower-bound y))
	(uy (upper-bound y)))
    ((cond 
       ((> lx 0) 
	(cond 
	  ((> ly 0)
	   (make-interval (* lx ly) (* ux uy)))
	  ((< uy 0)
	   (make-interval (* ux ly) (* lx uy)))
	  (else 
	    (make-interval (* ux ly) (* ux uy)))))
       ((< ux 0) 
	(cond 
	  ((> ly 0)
	   (make-interval (* lx uy) (* ux ly)))
	  ((< uy 0)
	   (make-interval (* lx ly) (* ux uy)))
	  (else 
	    (make-interval (* lx uy) (* lx ly)))))
       (else 
	 (cond 
	   ((> ly 0)
	    (make-interval (* lx uy) (* ux uy)))
	   ((< uy 0)
	    (make-interval (* ux ly) (* lx ly)))
	   (else 
	     (make-interval (min (* lx uy) (* ux ly))
			    (max (* lx ly) (* ux uy))))))))))
