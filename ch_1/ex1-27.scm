; Exercise 1.27:
; Demonstrate that the Carmichael numbers listed really do
; fool the Fermat test. That is, write a procedure that
; takes an integer n and tests whether a^n is conguent
; to a modulo n for every a < n, and try your procedure
; on the given Carmichael numbers.

(define (square x) (* x x)) 
  
(define (expmod base exp m) 
  (cond ((= exp 0) 1) 
        ((even? exp) 
         (remainder (square (expmod base (/ exp 2) m)) 
                    m)) 
        (else 
          (remainder (* base (expmod base (- exp 1) m)) 
                     m))))         

; literally a translation of what the author said
(define (fermat-test n)
  (define (iter a n)
    (if (= a n) #t
      (if (= (expmod a n n) a) 
          (iter (+ a 1) n) 
          #f)))
  (iter 1 n))

(fermat-test 2)
(fermat-test 11)
(fermat-test 13)
(fermat-test 16)

; Carmichael numbers -> not prime, but fools test!
(fermat-test 561)
(fermat-test 1105)
(fermat-test 1729)
(fermat-test 2465)
(fermat-test 2821)
(fermat-test 6601)

