; slice of code
(flatmap
  (lambda (new-row)
    (map (lambda (rest-of-queens)
	   (adjoin-position nw-row k rest-of-position))
	 (queen-cols (- k 1)))))
(enumerate-interval 1 board-size)

; 缓慢的原因：巨大的重复判断
