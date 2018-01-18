; Exercise 1.23:
; The smallest divisor procedure does a lot of needless things.
; After it checks to see if the number is divisible by 2 there
; is not point in checking to see if it is divisible by any
; larger even number.
; To implement this change, define a procedure next that returns
; 3 if its input is equal to 2 and otherwise returns its input 
; plus 2. Modify the smallest-divisor procedure to use (next test-divisor)
; instead of (+ test-divisor 1).
; Run the text for each of the 12 primes (nah) found in Exercise 1.22.
; Since this modification halves the number of steps, you should
; expect it to run about twice as fast. Is this expectation confirmed?
; If not, what is the observed ratio of the speeds of the two algorithms, 
; and how do you explain the fact that it is different from 2?


(define (timed-prime-test n)
  ;(newline)
  ;(display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time) n)))

(define (report-prime elapsed-time n)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))


(define (search-for-primes n range)
  (if (even? n)
      (search-primes (+ n 1) range)
      (seach-primes n range)))

(define (search-primes n range)
  (if (> range 0)
    (if (timed-prime-test n)
        (search-primes (+ n 2) (- range 1))
        (search-primes (+ n 2) range))))

(define (square x)
  (* x x))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (next input)
  (if (= input 2) 
      3
      (+ input 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))


(search-for-primes 10000000000 31)
(search-for-primes 100000000000 31)

; Old results:
; 10000000019 *** .06999999999999999
; 10000000033 *** .0800000000000000
; 10000000061 *** .08000000000000002

; 100000000003 *** .24
; 100000000019 *** .24
; 100000000057 *** .24

; New result:
; 10000000019 *** 4.9999999999999996e-2
; 10000000033 *** .05000000000000002
; 10000000061 *** .04999999999999999

; 100000000003 *** .14
; 100000000019 *** .14999999999999997
; 100000000057 *** .14

; Conclusion:
; The performance gain is not halved, but gets very close to it.
; Ex: 0.24/0.14 = 1.71
