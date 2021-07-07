#lang racket

; Adding Ratinal Numbers

(define (add-rat x y)
  (make-rat (+ (* (numer x)(denom y))(* (numer y) (denom x)))
            (* (denom x)(denom y))))

; Subtracting Rational Numbers

(define (sub-rat x y)
  (make-rat (- (* (numer x)(denom y))(* (numer y)(denom x)))
            (* (denom x)(denom y))))

; Multiplying Rational Numbers

(define (mul-rat x y)
  (make-rat (* (numer x)(numer y))
            (* (denom x)(denom y))))

; Dividing Rational Numbers

(define (div-rat x y)
  (make-rat (* (numer x)(denom y))
            (* (denom x)(numer y))))

; Equality of Rational Numbers

(define (equal-rat? x y)
  (= (* (numer x)(denom y))
            (* (numer y)(denom x))))

; Define make-rat to represent a rational number as a pair of 2 integers

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))
  
(define (numer x) (car x))
(define (denom x) (cdr x))

; Display output

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

; Testing the application

(define one-half (make-rat 1 2))
(print-rat one-half)

(define one-third (make-rat 1 3))
(print-rat one-third)

(print-rat (add-rat one-half one-third))

(print-rat (mul-rat one-half one-third))

(print-rat (add-rat one-third one-third))