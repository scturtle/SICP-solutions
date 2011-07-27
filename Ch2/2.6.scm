
(define zero 
  (lambda (f) (lambda (x) x))); 与f无关
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;(add-1 zero)
;=(lambda (f) (lambda (x) (f ((lambda (x) x) x))))
;=(lambda (f) (lambda (x) (f x)))
(define one
  (lambda (f) (lambda (x) (f x))))
; 以f为参数的函数,产生一个以x为参数的函数,
; 该函数用f对x进行1次f运算

;(add-1 one)
;=(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f x))) f) x))))
;=(lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
;=(lambda (f) (lambda (x) (f (f x))))
(define two
  (lambda (f) (lambda (x) (f (f x))))); 2次f
(define (+ a b)
  (lambda (f)
    (lambda (x)
      ((b f) ((a f) x)))))
;((a f) x)  -> x`=被进行了a次f运算的x
;((b f) x`) -> x``=对x`进行b次f运算=对x进行了a+b次f运算
