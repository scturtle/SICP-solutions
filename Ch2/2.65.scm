(load "2.63.scm")
(load "2.64.scm")

(define t1 '(1 2 3 4 5 6))
(define t2 '(4 5 6 7 8 9))

(define t1-tree (list->tree t1))
(define t2-tree (list->tree t2))
;(display t1-tree) (newline)
;(display t2-tree) (newline)

(load "2.62.scm")

(define (union-set-tree t1 t2)
  (let ((t1-list (tree->list-1 t1))
	(t2-list (tree->list-1 t2)))
    (list->tree (union-set t1-list t2-list))))

(define (intersection-set-tree t1 t2)
  (let ((t1-list (tree->list-1 t1))
	(t2-list (tree->list-1 t2)))
    (list->tree (intersection-set t1-list t2-list))))

(display (tree->list-1 (union-set-tree t1-tree t2-tree)))(newline)
(display (tree->list-1 (intersection-set-tree t1-tree t2-tree)))(newline)
