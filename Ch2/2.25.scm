(display
  (car (cdaddr 
    '(1 3 (5 7) 9)
    )))
(newline)
(display
  (caar 
    '((7))
    ))
(newline)
(display
  (cadadr (cadadr (cadadr 
    '(1 (2 (3 (4 (5 (6 7))))))
    ))))
(newline)
