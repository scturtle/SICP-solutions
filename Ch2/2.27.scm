(define nil '())

(define (deep-reverse l)
  (define (iter l ans)
    (if (null? l)
      ans
      (if (not (pair? l))
	l
	(iter (cdr l)
	      (cons (deep-reverse (car l)) ans)))))
    (iter l nil))

  (display
    (deep-reverse (list (list 1 2) (list 3 4)) ))
  (newline)
