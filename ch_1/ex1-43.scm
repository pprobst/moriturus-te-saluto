; Exercise 1.43:
; Write a procedure that takes as inputs a procedure that computes
; f and a positive integer n and returns the procedure that computes
; the n^th repeated application of f. Example:
; ((repeated square 2) 5)

(define (square x)
  (* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
    f
    (compose f (repeated f (- n 1)))))

((repeated square 2) 5)
