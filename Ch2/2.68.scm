(use-modules (ice-9 debug))
(load "2.67.scm")

; so ugly ...
(define (encode-symbol symbol tree)
  (let ((left (left-branch tree))
	(right (right-branch tree)))
    (let ((leftans
	    (if (leaf? left)
	      ; left is a leaf
	      (if (eq? symbol (symbol-leaf left))
		'()
		#f)
	      ; left is a tree
	      (let ((ans (encode-symbol symbol left)))
		(if ans ans #f))))
	  (rightans
	    (if (leaf? right)
	      ; right is a leaf
	      (if (eq? symbol (symbol-leaf right))
		'()
		#f)
	      ; right is a tree
	      (let ((ans (encode-symbol symbol right)))
		(if ans ans #f)))))
      (if (and (not leftans) (not rightans))
	#f
	(if leftans (cons 0 leftans) 
	  (cons 1 rightans))))))

;(trace encode-symbol)
;(display (encode-symbol 'A sample-tree))

; given
(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
	    (encode (cdr message) tree))))
;(display (encode '(A D A B B C A) sample-tree)) (newline)
