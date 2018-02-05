; Exercise 1.24:
; Modify the timed-prime-test procedure to use fast-prime?
; (the Fermat method), and test each of the 12 primes you
; found in that exercise. Since the Fermat test has O(log n)
; growth, how would you expect the time to test primes near
; 1000000 to compare with the time needed to test primes near
; 1000? Does your data bear this out? Can you explain any
; discrepancy you find?

; OBS: my original code wasn't working for some reason, so this
;      is an almost direct copy from http://community.schemewiki.org/?sicp-ex-1.24
;      I wouldn't include it, but for the sake of completion w/e

(define (square x) (* x x))

(define (expmod base exp m)
   (cond ((= exp 0) 1)
         ((even? exp)
          (remainder (square (expmod base (/ exp 2) m))
                     m))
         (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (fermat-test n)
   (define (try-it a)
     (= (expmod a n n) a))
   (try-it (+ 1 (random-integer (- n 1)))))

(define (fast-prime? n times)
   (cond ((= times 0) true)
         ((fermat-test n) (fast-prime? n (- times 1)))
         (else false)))

(define (prime? n)
   ; Perform the test how many times?
   ; Use 100 as an arbitrary value.
   (fast-prime? n 100))

(define (timed-prime-test n)
   (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
   (if (prime? n)
       (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
   (newline)
   (display n)
   (display " *** ")
   (display elapsed-time))

(define (search-for-primes n range)
  (if (even? n)
      (search-primes (+ n 1) range)
      (search-primes n range)))

(define (search-primes n range)
  (if (> range 0)
    (if (timed-prime-test n)
        (search-primes (+ n 2) (- range 1))
        (search-primes (+ n 2) range))))

; Tests
(search-for-primes 10000000000 31)
(search-for-primes 100000000000000000000 80)
