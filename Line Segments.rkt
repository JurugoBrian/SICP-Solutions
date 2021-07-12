#lang racket

; Defining a line segment make-segment

(define (make-segment start-point end-point)
  (cons start-point end-point))

; Defining selectors start-segment and end-segment

(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

; Defining a constructor make-point

(define (make-point x-cordinate y-cordinate)
  (cons x-cordinate y-cordinate))

; Defining selctors x-point and y-point

(define (x-point cordinate) (car cordinate))
(define (y-point cordinate) (cdr cordinate))

; Defining procedure midpoint-segment

(define (midpoint-segmenent ))