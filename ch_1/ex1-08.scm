; Exercise 1.8:
; Newton's method for cube roots

; (x/y² + 2y)/ 3

(define (cube-root-iter guess x)
	(if (good-enough? guess x)
		 guess
		 (cube-root-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (* guess guess guess) x))
     (/ x 10000)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 
	  3))

(define (square x) (* x x))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(cube-root 64)
(cube-root 125)
(cube-root 1)
