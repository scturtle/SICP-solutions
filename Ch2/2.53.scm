(map (lambda (v) (display v) (newline))
     (list
	       (list 'a 'b 'c)
	       (list (list 'george))
	       (cdr '((x1 x2) (y1 y2)))
	       (cadr '((x1 x2) (y1 y2)))
	       (pair? (car '(a short list)))
	       (memq 'red '((red shoes) (blue socks)))
	       (memq 'red '(red shoes blue socks))))

;  (a b c)
;  ((george))
;  ((y1 y2))
;  (y1 y2)
;  #f
;  #f
;  (red shoes blue socks)
