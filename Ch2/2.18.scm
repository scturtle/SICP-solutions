(use-modules (ice-9 debug))

(define nil '())

;To avoid using append
(define (reverse l)
  (define (append-last l x)
    (if (null? l)
      (list x)
      (cons (car l) (append-last (cdr l) x))))
  (if (null? l)
    nil
    (append-last (reverse (cdr l)) (car l))))

;(trace reverse)
(display
  (reverse (list 1 4 9 16 25)))
(newline)
(display
  (reverse nil))
(newline)

; ref to : 2.22 迭带 传递结果
(define (reverse l)
  (define (iter l ans)
    (if (null? l)
      ans
      (iter (cdr l)
	    (cons (car l) ans))))
  (iter l nil))

(display
  (reverse (list 1 4 9 16 25)))
(newline)
