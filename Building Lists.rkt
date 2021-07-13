#lang racket

(define one-2-four (list 1 2 3 4))

one-2-four
(car one-2-four)
(cdr one-2-four)
(car (cdr one-2-four))
(cdr (cdr one-2-four))
(cons 10 one-2-four)
(cons 5 one-2-four)

; list operations

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))
(define squares (list 1 4 9 16 25))
(list-ref squares 3)