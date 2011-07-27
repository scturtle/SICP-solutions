(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))

; a)
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (cadr mobile))
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (cadr branch))

; b)
(define (total-weight mobile)
  (define (total-branch-weight branch)
    (let ((struct (branch-structure branch)))
    (if (pair? struct)
      (total-weight struct)
      struct)))
  (+ (total-branch-weight (left-branch mobile)
			  (right-branch mobile))))

; c)
(define (is-blance mobile)
  (let
    ((left  (left-branch  mobile))
     (right (right-branch mobile)))
  (and
    (= (* (branch-length left)  (total-weight  left))
       (* (branch-length right) (total-weight right)))
    (is-blance left)
    (is-blance right))))

; d)
; cadr -> cdr
