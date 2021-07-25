#lang racket
; Account example to show Modularity, Objects, and States

; Balance having a global scope
(define balance 100)

(define (withdraw amount)
  (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "Insuffucient funds"))

; Balance having a local state
(define new-withdraw
  (let ((balance 100))
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "Insufficient funds"))))

; make-withdraw procedure creates  "withdrawal processors"
(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds")))

(define W1 (make-withdraw 100))
(define W2 (make-withdraw 100))
(W1 50)
(W2 70)
(W2 40)
(W1 40)
(W1 50)

; A procedure that returns a "bank-account object" with a specified initial balance
(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposite amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposite) deposite)
          (else (error "Unknown request -- MAKE-ACCOUNT" m))))
  dispatch)


(define acc (make-account 100))
((acc 'withdraw) 50)
((acc 'withdraw) 60)
((acc 'deposite) 40)
((acc 'withdraw) 60)

(define acc2 (make-account 500))
((acc2 'withdraw) 100)