
(define (split proc1 proc2)
  (lambda (painter n)
    (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
	(proc1 painter (proc2 smaller smaller))))))
