(load "ch2.3.4.scm")

(define (successive-merge set)
  (cond
    ((null? (cdr set))
    (car set))
    (else
      (successive-merge 
	(adjoin-set 
	  (make-code-tree (car set) (cadr set))
	  (cddr set))))))

; given
(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

;(display (generate-huffman-tree '((A 4) (B 2) (C 1) (D 1)))) (newline)
