; Exercise 1.7:
; [...] watch how guess changes from one iteration to the next
; and to stop when the change is a very small fraction of the
; guess.
; Design a square-root procedure that uses this kind of end test.
; Does this work better for small and large numbers?

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
	   guess
	   (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (* guess guess) x))
	 (/ x 10000)))

; guess that the square root of any number is 1
(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 100000000)
(sqrt 0.0000001)
