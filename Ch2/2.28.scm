(define (fringe t)
  (if (null? t)
    '()
    (if (pair? (car t))
      (append (fringe (car t)) (fringe (cdr t)))
      (cons (car t) (fringe (cdr t))))))

(define x '((1 2) (3 4)))
(display (fringe x))
(newline)
(display (fringe (list x x)))
(newline)
