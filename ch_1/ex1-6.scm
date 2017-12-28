; Exercise 1.6:
; Test the algorithm below with the new-if procedure; 
; explain what happens.

;(define (sqrt-iter guess x)
;  (if (good-enough? guess x)
;      guess
;      (sqrt-iter (improve guess x)
;                 x)))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
		(else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
		  guess
		  (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; guess that the square root of any number is 1
(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)
(sqrt 2)

; By running the code, we stumble across the following error:
; > ;Aborting!: maximum recursion depth exceeded

; This happens because new-if uses applicative-order evaluation.
; Remember that, in this case, the interpreter evaluates as it follows:
; 1) evaluates operator
; 2) evaluates operand
; 3) applies procedure to args

; The else-clause will be evaluated forever.
