(define (square x) (* x x))
(define nil '())

(define (square-tree items)
  (cond
    ((null? items) nil)
    ((not (pair? items)) (square items))
    (else
      (cons (square-tree (car items)) (square-tree (cdr items))))))

(define (square-tree items)
  (define (sq items)
    (if (pair? items)
      (square-tree items)
      (square items)))
  (map
    sq items))

(display
  (square-tree (list 1
		     (list 2
			   (list 3 4) 5)
		     (list 6 7))))
(newline)
