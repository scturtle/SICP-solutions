(load "2.68.scm")
(load "2.69.scm")

(define test-symbols '((a 2)(na 16)(boom 1)(sha 3)(get 2)(yip 9)(job 2)(wah 1)))

(define test-tree (generate-huffman-tree test-symbols))
(display test-tree)(newline)

(define test-message '(get a job sha na na na na na na na na get a job sha na na na na na na na na wah yip yip yip yip yip yip yip yip yip sha boom))

;(map (lambda (s)
;       (display s)
;       (display (encode-symbol (car s) test-tree))
;       (newline))
;     test-symbols)
(define code (encode test-message test-tree))
(display code)(newline)
(display (length code))(newline)
(display (* 36 3))(newline)
