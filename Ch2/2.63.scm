(load "bst.scm")

;They are damn the same!
;The second one is slower.

(define (tree->list-1 tree)
  (if (null? tree)
    '()
    (append (tree->list-1 (left-branch tree))
	    (cons (entry tree)
		  (tree->list-1 (right-branch tree))))))
(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
      result-list
      (copy-to-list (left-branch tree)
		    (cons (entry tree)
			  (copy-to-list (right-branch tree)
					result-list)))))
  (copy-to-list tree '()))

(define t1 (make-tree 7 
		     (make-tree 3 
				(make-tree 1 '() '()) 
				(make-tree 5 '() '()))
		     (make-tree 9 
				'() 
				(make-tree 11 '() '()))))

(define t2 (make-tree 3 
		     (make-tree 1 '() '()) 
		     (make-tree 7
				(make-tree 5 '() '())
				(make-tree 9
					   '()
					   (make-tree 11 '() '())))))
(define t3 (make-tree 5 
		     (make-tree 3
				(make-tree 1 '() '())
				'())
		     (make-tree 9
				(make-tree 7  '() '())
				(make-tree 11 '() '()))))


;(display (tree->list-1 t1))(newline)
;(display (tree->list-2 t1))(newline)
;(display (tree->list-1 t2))(newline)
;(display (tree->list-2 t3))(newline)
;(display (tree->list-1 t3))(newline)
;(display (tree->list-2 t2))(newline)
