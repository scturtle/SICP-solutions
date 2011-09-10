(load "ch2.2.3.scm")

(define (flatmap proc seq)
  (accumulate append `() (map proc seq)))

(define (enumerate-interval a b)
  (if (> a b)
    `()
    (cons a (enumerate-interval (+ a 1) b))))

(define (unique-pairs n)
       (flatmap (lambda (i)
	      (map (lambda (j) (list j i))
		   (enumerate-interval 1 (- i 1))))
	    (enumerate-interval 2 n)))

;(display
  ;(enumerate-interval 1 10)
  ;(unique-pairs 3)
  ;)

; prime-sum-pairs can be:

;(define (prime-sum-pairs n)
;  (map make-pair-sum
;       (filter prime-sum?
;	       (unique-pairs n))))
