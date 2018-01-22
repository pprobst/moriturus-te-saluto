; Exercise 1.30:
; The sum procedure shown in the book generates a linear
; recursion. The procedure can be rewritten so that the sum
; is performed iteratively. Show how to do this.

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ (term a) result))))
  (iter a 0))


; Tests
(define (inc n)
  (+ n 1))

(define (cube n)
  (* n n n))

(define (sum-cubes a b)
  (sum cube a inc b))

(sum-cubes 1 10)
