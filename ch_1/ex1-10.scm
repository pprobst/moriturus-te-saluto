; Exercise 1.10:
 
; (A)
; The following procedure computes a mathematical function called
; "Ackermann's function".
; https://en.wikipedia.org/wiki/Ackermann_function

(define (A x y)
  (cond ((= y 0) 0)
		((= x 0) (* 2 y))
		((= y 1) 2)
		(else (A (- x 1) (A x (- y 1))))))

; What are the values of the following expressions?
(A 1 10)
(A 2 4)
(A 3 3)

; Ok, I'm to lazy right now to do this manually using the substitution
; model. Still, the principles we'll follow to evaluate the expressions
; above are the same ones we used while evaluating the recursive process
; in 1.9.
; Maybe it's better to do this with pencil & paper.


; (B)
; Consider the following procedures, where A is the procedure defined
; above:

(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
(define (k n) (* 5 n n))

; Give consice mathematical definitions for the functions computed by
; the procedures f, g and h for positive integer values of n.
; For example, (k n) computes 5n².

; Suggestion: run the code for different values and make a definition
; from the results.

(g 0)
(g 1)
(g 2)
(g 3)
(g 4)
(g 5)

(h 0)
(h 1)
(h 2)
(h 3)
(h 4)
(h 5)

; f --> 2n

; g --> (g 0) = 0
;   --> (g 1) = 2
;   --> (g 2) = 4
;   --> (g 3) = 8
;   --> (g 4) = 16
;   --> (g 5) = 32
;   --> 2^n

; h --> (h 0) = 0
;   --> (h 1) = 2
;   --> (h 2) = 4
;   --> (h 3) = 16
;   --> (h 4) = 65536 
;   --> (h 5) = Aborting!: maximum recursion depth exceeded
;   --> 2^(h(n-1))

