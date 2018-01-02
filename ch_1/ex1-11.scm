; Exercise 1.11:
; A function f is defined by the rule that

; f(n) = (n if n < 3)
;      = (f(n-1) + 2f(n-2) + 3f(n-3) if n >= 3)

; Write a procedure that computes f by means of a recursive process.
; Write a procedure that computes f by means of an iterative process.


; Recursive solution: just plug the definition.

(define (f-rec n)
  (if (< n 3) 
	n
	(+ (f-rec (- n 1))
	   (* 2 (f-rec (- n 2))) 
	   (* 3 (f-rec (- n 3))))))


; Iterative solution:
; Ok. This was pretty complicated to write, initially. It helps to
; think this as a while loop. The solution is also similar to the 
; Fibonacci iterative solution we saw a while ago.
; In the Fibonacci sequence, we used a pair of integers a and b 
; initialized as 1 and 0. Here, to follow the definition rule, we'll
; use the triplet n2 = 2, n1 = 1, n0 = 0 (these are just starting values).

(define (f-iter n)
  (f-iteration 2 1 0 n))

(define (f-iteration n2 n1 n0 n)
  ; n will act as a counter
  (if (= n 0)
	n0
	(f-iteration (+ n2 (* 2 n1) (* 3 n0)) ; new n2
				 n2 ; new n1
				 n1 ; new n0
				 (- n 1)))) ; n--

; Tests
(f-rec 0)
(f-rec 2)
(f-rec 3)
(f-rec 6)
(f-iter 0)
(f-iter 2)
(f-iter 3)
(f-iter 6)
