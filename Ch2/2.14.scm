(load "2.7.scm")
;========================================================
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
		(add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
		  (add-interval (div-interval one r1)
				(div-interval one r2)))))

;========================================================
(define r1 (make-interval 5000 5001))
(define r2 (make-interval 6000 6001))
(display (par1 r1 r2))
(newline)
(display (par2 r1 r2))
(newline)
;精度问题吧
;后面一问再说
