;"The result returned by partial-tree is a pair (formed with cons) whose car is the constructed tree and whose cdr is the list of elements not included in the tree."

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
    (cons '() elts)
    (let ((left-size (quotient (- n 1) 2))) ; (quotient 3 2) get 1
      (let ((left-result (partial-tree elts left-size))) ; it's easy to understand
	(let ((left-tree (car left-result)) ; the left result
	      (non-left-elts (cdr left-result)) ; the entry and right part
	      (right-size (- n (+ left-size 1))))
	  (let ((this-entry (car non-left-elts)) ; the entry
		(right-result (partial-tree (cdr non-left-elts) right-size)))
	    (let ((right-tree (car right-result)) ; the right result
		  (remaining-elts (cdr right-result)))
	      (cons (make-tree this-entry left-tree right-tree) ; make it!
		    remaining-elts)))))))) ; the remaining elts is great. It can transport elts and it can be '() eventually.

;     5
;    / \
;   3   9
;  /   / \
; 1   7   11

;O(n) it make and only make each element a tree once.
