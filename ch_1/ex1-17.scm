; Exercise 1.17:
; The following multiplication procedure is analogous
; to the expt procedure:

(define (* a b)
  ; repeated addition
  (if (= b 0)
    0
    (+ a (* a (- b 1)))))

; This algorithm takes a number of steps that is linear
; in b. Now suppose we include, together with addition,
; operations double, which doubles an integer, and halve,
; which divides an (even) integer by 2. Using these, design
; a multiplication procedure analogous to fast-expt that
; uses a logarithmic number of steps.

; tl;dr do a fast-mult procedure

(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (square x)
  (* x x))

(define (even? x)
  (= (remainder x 2) 0))

(define (fast-mult a b)
  (cond ((= b 0) 0)
        ((even? b) (double (* a (halve b))))
        (else (+ a (* a (- b 1))))))

; 5 * 2 = 2 * (5 * (2/2)) --> b (2) is even
; 2 * 7 = 2 + (2 * (7-1)) --> b (7) is odd

; Tests
(fast-mult 5 2)
(fast-mult 10 4)
(fast-mult 4 20)
(fast-mult 1 1)
(fast-mult 6 6)
