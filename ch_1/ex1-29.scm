; Exercise 1.29:
; Define a procedure that takes as arguments f, a, b and n
; and returns the value of the integral, computed using
; Simpson's Rule. Use your procedure to integrate cube 
; between 0 and 1 (with n = 100 and n = 1000), and compare
; the results to those of the integral procedure shown earlier.

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (cube a)
  (* a a a))

(define (inc n)
  (+ n 1))

(define (simpsons f a b n)
  (define h-term
    (/ (- b a)
       n))
  (define (yk-term k)
    (f (+ a (* k h-term))))
  (define (k-term k)
    (* (cond ((or (= k 0) (= k n)) 1)
             ((even? k) 2)
             (else 4))
       (yk-term k)))
  (* (/ h-term 3) (sum k-term 0 inc n)))

; Tests
(simpsons cube 0 1 100)
(simpsons cube 0 1 1000)

