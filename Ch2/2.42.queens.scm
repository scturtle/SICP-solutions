(load "2.40.scm")
(use-modules (ice-9 debug))

(define empty-board `())
(define (adjoin-position i j rest-of-queens)
  (cons (list i j) rest-of-queens))

;(display
  ;;(adjoin-position 2 3 `((1 2) ( 3 4)))
  ;(adjoin-position 2 3 empty-board)
  ;)
;(exit)

(define (safe? k positions)
  (let ((new (car positions))
	(olds (cdr positions)))
    (define (fit? k olds)
      (if (= k 0)
	#t
	(let ((old (car olds)))
	  (cond ((= (car new) (car old)) #f)
		((= (+ (car new) (cadr new)) (+ (car old) (cadr old))) #f)
		((= (- (car new) (cadr new)) (- (car old) (cadr old))) #f)
		(#t (fit? (- k 1) (cdr olds)))))))
    (fit? (- k 1) olds)))

;(display
  ;(safe? 3 `((4 3) (3 2) (1 1)))
  ;)
;(exit)


(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter
	(lambda (positions) (safe? k positions))
	(flatmap (lambda (rest-of-queens)
		   (map (lambda (new-row)
			  (adjoin-position new-row k rest-of-queens))
			(enumerate-interval 1 board-size)))
		 (queen-cols (- k 1))))))
  (queen-cols board-size))

(display
  (length (queens 7))
  )
