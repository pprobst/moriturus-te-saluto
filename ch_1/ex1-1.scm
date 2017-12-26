; Exercise 1.1

; What's the result printed by the interpreter in response to each expression below?
; (I purposely divided this in multiple steps, so it may not be exactly how the 
; interpreter will show the results; however, the real meaning is the same)

10
; 10

(+ 5 3 4)
; 12

(- 9 1)
; 8

(/ 6 2)
; 3

(+ (* 2 4) (- 4 6))
; + 8 -2
; 6

(define a 3)
; a <- 3
; a

(define b (+ a 1))
; b <- 3 + 1
; b <- 4
; b

(+ a b (* a b))
; (+ 3 4 (* 3 4))
; (+ 3 4 12)
; 19

(= a b)
; a = b
; 3 = 4?
; #f

(if (and (> b a) (< b (* a b)))
  b
  a)
; 4 > 3       --> #t
; 4 < (* 4 3) --> #t
; and #t #t   --> #t
; b
; 4

(cond ((= a 4) 6)
	  ((= b 4) (+ 6 7 a))
	  (else 25))
; 3 = 4? #f
; 4 = 4? #t 
;   (+ 6 7 3)
;   16

(+ 2 (if (> b a) b a))
; 4 > 3? #t
; + 2 4
; 6
; # notice that 'a' is the value to be used in the "hidden" else clause #

(* (cond ((> a b) a)
		 ((< a b) b)
		 (else -1)))
	(+ a 1)
; * (4) (3 + 1)
; 16
