; Exercise 1.31:
; The sum procedure is only the simplest of a vast number of similar
; abstractions that can be captured as higher-order procedures.
; Write an analogous procedure called product that returns the product
; of the values of a function at points over a given range. Show how to
; determine factorial in terms of product. Also use product to computate
; the approximation to pi using the formula
; pi/4 = (2*4*4*6*6*8*...)/(3*3*5*5*7*7*...)

; If your procedure generates a recursive process, write one that generates
; an iterative process. Do the opposite if it generates an iterative process.

; Iterative
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
    (iter a 1))

; Recursive
(define (product-rec term a next b)
  (if (> a b)
    1
    (* (term a)
       (product-rec term (next a) next b))))

; Auxiliary procedures
(define (inc n)
  (+ n 1))

(define (identity n)
  n)

(define (square x)
  (* x x))

; Factorial
(define (fact n)
  (product identity 1 inc n))

(define (fact-rec n)
  (product-rec identity 1 inc n))

(fact 5)
(fact-rec 5)

; Approximations to pi
; I wasn't able to think of a good translation for this exercise, so I
; researched about it and found about Wallis product.
; (Again, thanks to Bill the Lizard)
; https://en.wikipedia.org/wiki/Wallis_product
(define (pi-approx n)
  (define (div x)
    (/ (* 4.0 (square x))
       (- (* 4.0 (square x)) 1)))
  (* 2.0 (product div 1 inc n)))

(pi-approx 5)
(pi-approx 10)
(pi-approx 15)
(pi-approx 20)
(pi-approx 100)
