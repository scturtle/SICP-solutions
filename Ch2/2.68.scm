(use-modules (ice-9 debug))
(load "2.67.scm")

(define (encode-symbol symbol tree)
  (if (leaf? tree)
    (if (eq? symbol (symbol-leaf tree))
      '()
      #f)
    (let ((leftans (encode-symbol symbol (left-branch tree)))
	  (rightans (encode-symbol symbol (right-branch tree))))
      (if (and (not leftans) (not rightans))
	#f
	(if leftans (cons 0 leftans) 
	  (cons 1 rightans))))))

;(trace encode-symbol)
;(display (encode-symbol 'B sample-tree))

; given
(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
	    (encode (cdr message) tree))))
;(display (encode '(A D A B B C A) sample-tree)) (newline)
