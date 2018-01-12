; Exercise 16:
; Design a procedure that evolves an iterative 
; exponentation process that uses successive squaring
; and uses a logarithmic number of steps, as does
; fast-expt.

; I had trouble understanding this exercise initially,
; so all credits to the solution goes to Bill the Lizard
; (http://www.billthelizard.com/2010/01/sicp-exercise-116-fast-exponentiation.html)

(define (fast-expt-iter a b n)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter a (square b) (/ n 2)))
        (else (fast-expt-iter (* a b) b (- n 1)))))

(define (fast-expt b n)
  (fast-expt-iter 1 b n))

(define (even? n)
  (= (remainder n 2) 0))

(define (square x)
  (* x x))

; Tests
(fast-expt 5 2)
(fast-expt 10 4)
(fast-expt 4 20)
(fast-expt 1 1)
(fast-expt 6 6)

