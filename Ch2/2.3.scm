(load "2.2.scm")

(define (rect lb rt) (cons lb rt))
(define (rect-lb r) (car r))
(define (rect-rt r) (cdr r))

(define (rect-h r)
  (abs (- (y-point (rect-rt r))
	  (y-point (rect-lb r)))))

(define (rect-w r)
  (abs (- (x-point (rect-rt r))
	  (x-point (rect-lb r)))))

(define (rect1 lb h w)
  (cons lb (cons h w)))

(define (rect1-h r) (abs (car (cdr r))))
(define (rect1-w r) (abs (cdr (cdr r))))

(define (perimeter r geth getw)
  (* 2 (+ (geth r) (getw r))))

(define (size r geth getw)
  (* (geth r) (getw r)))

(define r (rect (make-point 1 1) (make-point 4 4)))
(display (perimeter r rect-h rect-w)) (newline)
(display (size r rect-h rect-w)) (newline)

(define r1 (rect1 (make-point 1 1) 3 3))
(display (perimeter r1 rect1-h rect1-w)) (newline)
(display (size r1 rect1-h rect1-w)) (newline)
