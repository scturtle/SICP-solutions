
(define (below painter1 painter2)
  (let ((paint-down
	  (transform-painter painter1
			     (make-vect 0.0 0.0)
			     (make-vect 1.0 0.0)
			     (make-vect 0.0 0.5)))
	(paint-up
	  (transform-painter painter2
			     (make-vect 0.0 0.5)
			     (make-vect 1.0 0.5)
			     (make-vect 0.0 1.0))))
    (lambda (frame)
      (paint-down frame)
      (paint-up frame))))
