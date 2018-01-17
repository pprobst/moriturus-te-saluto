; Exercise 1.22:
; The following timed-prime-test procedure, when called
; with an integer n, prints n and checks to see if n is
; prime. If n is prime, the procedure prints 3 asterisks
; followed by the amount of time used in performing the
; test.

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

; Using this procedure, write a procedure search-for-primes
; that checks the primality of consecutive odd integers in a
; specified range. Use your procedure to find the 3 smallest
; primes larger than 1000; larger than 10000; larger than
; 100000; larger than 1000000.
; Note the time needed to test each prime. Since the testing
; algorithm has order of growth O(sqrt(n)), you should expect
; that testing for primes around 10000 should take about sqrt(10)
; times as long as testing for primes around 1000. 
; (a) Do your data bear this out:?
; (b) How well do the dara for 100000 and 1000000 support the 
;     O(sqrt(n)) prediction? 
; (c) Is your result compativle with the notion that programs on
;     your machine run in time proportional to the number of steps
;     required for the computation?

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

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))


; Tests
;(search-for-primes 1000 10)
;(search-for-primes 10000 10)
;(search-for-primes 100000 10)
;(search-for-primes 1000000 10)

; This exercise is obviously dated, as my computer doesn't feel
; pressured to computate such values. Therefore, I need to test 
; with with higher order numbers.
(search-for-primes 10000000000 31)
(search-for-primes 100000000000 31)

; My machine:
; 10000000019 *** .06999999999999999
; 10000000033 *** .0800000000000000
; 10000000061 *** .08000000000000002

; 100000000003 *** .24
; 100000000019 *** .24
; 100000000057 *** .24

; Notice how 0.24 = 0.08 * 3
; and 3 =~ sqrt(10)
; Therefore, the growth occurred as predicted.
