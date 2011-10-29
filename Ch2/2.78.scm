(define (attach-tag type-tag contents)
  (if (number? contents)
    contents
    (cons type-tag contents)))
(define (type-tag datum)
  (if (number? contents)
    'scheme-number
    (if (pair? datum)
      (car datum)
      (error "Bad tagged datum -- TYPE-TAG" datum))))
(define (contents datum)
  (if (number? contents)
    contents
    (if (pair? datum)
      (cdr datum)
      (error "Bad tagged datum -- CONTENTS" datum))))
