; Exercise 1.20:
; Consider the iterative gcd procedure given below.

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))
; Using the substitution method (for normal-order
; evaluation), illustrate the process generated in
; evaluating (gcd 206 40) and indicate the remainder
; operations that are actually performed. 
; How many remainder operations are actually performed
; in the normal-order evaluation of (gcd 206 40)?
; In the applicative-order evaluation?

; ---------------------

;; Normal-order: applying values directly
; (gcd 206 40)

; if (40 == 0) -> 206 (F)
; gcd 40 (206 % 40) --> gcd 40 6

; if ((206 % 40) == 0) -> 40 (F)
; gcd (206 % 40) (40 % (206 % 40) --> gcd 6 (40 % 6) --> gcd 6 4

; if (40 % (206 % 40) == 0) --> 6 (F)
; gcd (40 % (206 % 40) ((206 % 40) % (40 % (206 % 40)) --> gcd 4 2

; if ((206 % 40) % (40 % (206 % 40) == 0) --> 4 (F)
; gcd (206 % 40) % (40 % (206 % 40)) ((40 % (206 % 40) % ((206 % 40) % (40 % (206 % 40))) --> gcd 2 0 

; if (((40 % (206 % 40)) % (((206 % 40) % (40 % (206 % 40)))) == 0) --> 2 (V)

; 18 remainders evaluated (don't take my parentheses for granted!)

; --------------------

;; Applicative-order: evaluate first, then apply
; (gcd 206 40)

; gcd 40 (206 % 40)
; gcd 40 6 ; here

; gcd 6 (40 % 6)
; gcd 6 4 ; here

; gcd 4 (6 % 4)
; gcd 4 2 ; here

; gcd 2 (4 % 2)
; gcd 2 0 ; here

; 4 remainders evaluated

(gcd 206 40)
