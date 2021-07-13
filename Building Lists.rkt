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

; Primitive null? to test for empty list & length to return
; the length of a list
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))
(define odds (list 1 3 5 7 9 11 13 15))
(length odds)