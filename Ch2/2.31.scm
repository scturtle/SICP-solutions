(define (tree-map f tree)
  (define (each-do tree)
    (if (pair? tree)
      (tree-map f tree)
      (f tree)))
  (map each-do tree))

(define (square x) (* x x))
(define (square-tree tree) (tree-map square tree))

(display
  (square-tree (list 1
		     (list 2
			   (list 3 4) 5)
		     (list 6 7))))
(newline)
