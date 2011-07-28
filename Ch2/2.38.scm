(load "ch2.2.3.scm")
(define fold-right accumulate)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest))
	    (cdr rest))))
  (iter initial sequence))

(define (show lst)
  (if (null? lst)
    '()
    (begin
      (display (car lst))
      (newline)
      (show (cdr lst)))))

;(show (list
	;(fold-right / 1 (list 1 2 3))
	;(fold-left / 1 (list 1 2 3))
	;(fold-right list '() (list 1 2 3))
	;(fold-left list '() (list 1 2 3))
	;))
