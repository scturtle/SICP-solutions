(define (for-each f l)
  (if (null? l)
    #t
    (begin
      (f (car l))
      (for-each f (cdr l)))))

(for-each (lambda (x) (display x) (newline))
	  (list 57 321 88))
