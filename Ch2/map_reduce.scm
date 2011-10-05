(define (map op lst)
  (if (null? lst)
    '()
    (cons (op (car lst)) (map op (cdr lst)))))

(define (reduce op initial lst)
  (define (iter lst result)
    (if (null? lst)
      result
      (op (car lst) (iter (cdr lst) result))))
  (iter lst initial))

(display
  (map (lambda (x) (* x x)) '(1 2 3 4 5)))
(newline)

(display
  (reduce + 0 '(1 2 3 4 5)))
(newline)
