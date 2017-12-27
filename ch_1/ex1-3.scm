; Exercise 1.3:
; Define a procedure that takes three numbers as arguments and returns
; the sum of the squares of the two larger numbers.

(define (square-sum-largest-two a b c)
  (if (>= a b)
	  (square-sum a (if (>= b c) b c))
	  (square-sum b (if (>= a c) a c))))

(define (square n) (* n n))

(define (square-sum n m) (+ (square n) (square m)))

(square-sum-largest-two 6 7 2)
(square-sum-largest-two 3 10 1)
(square-sum-largest-two 1 8 2)
(square-sum-largest-two 1 1 1)
(square-sum-largest-two 5 2 5)
