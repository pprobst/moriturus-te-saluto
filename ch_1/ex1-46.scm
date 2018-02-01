; Exercise 1.46:
; Several of the numerical methods described in this chapter are instances 
; of an extremely general computational strategy known as iterative 
; improvement. Iterative improvement says that, to compute something, we 
; start with an initial guess for the answer, test if the guess is good 
; enough, and otherwise improve the guess and continue the process using 
; the improved guess as the new guess.
; Write a procedure iterative-improve that takes two procedures as arguments:
; a method for telling whether a guess is good enough and a method for 
; improving a guess.
; Iterative-improve should return as its value a procedure that takes a guess 
; as argument and keeps improving the guess until it is good enough. 
; Rewrite the sqrt procedure of 1.1.7 and the fixed-point procedure of 1.3.3 
; in terms of iterative-improve. 

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (iterative-improve good? improve)
  (define (iter guess)
	(if (good? guess)
	  guess
	  (iter (improve guess))))
  iter)

(define (square-root x guess)
  (define (improve guess)
	(average guess (/ x guess)))
  (define (good-enough? guess)
	(< (abs (- (square guess) x)) 0.001))
  ((iterative-improve good-enough? improve) guess))

(square-root 36 1.0)
(square-root 64 1.0)
(square-root 100 1.0)

(define (fixed-point f guess)
  (define (improve guess)
	(f guess))
  (define (good-enough? guess)
	(< (abs (- (f guess) guess)) 0.001))
  ((iterative-improve good-enough? improve) guess))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0) ; from ex 1.36
