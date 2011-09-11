
;a skipped

;b weird
(define (corner-split painter n)
  (if (= n 0)
    painter
    (let ((paint-up
	    (transform-painter (up-split painter n)
			       (make-vect 0.0 0.0)
			       (make-vect 0.5 0.0)
			       (make-vect 0.0 1.0)
			       ))
	  (paint-right
	    (transform-painter (right-split painter n)
			       (make-vect 0.5 0.0)
			       (make-vect 1.0 0.0)
			       (make-vect 0.5 1.0)
			       ))
	  (corner 
	    (transform-painter (corner-split painter (- n 1))
			       (make-vect 0.5 0.5)
			       (make-vect 1.0 0.5)
			       (make-vect 0.5 1.0)
			       )))
      (lambda (frame)
	(paint-up frame)
	(paint-right frame)
	(corner frame)))))

;c
(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-vert rotate180 
				  identity flip-horiz)))
    (combine4 (corner-split painter n))))
