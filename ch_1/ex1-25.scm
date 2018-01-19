; Exercise 1.25:
; Alyssa P. Hacker complains that we went to a lot
; of extra work in writing expmod. After all, she
; says, since we already know how to compute exponentials,
; we could have simply written:

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

; Is she correct? Would this procedure serve as well
; for our fast prime tester? Explain.

(define (square x) (* x x)) 

(define (fast-expt-iter a b n)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter a (square b) (/ n 2)))
        (else (fast-expt-iter (* a b) b (- n 1)))))

(define (fast-expt b n)
  (fast-expt-iter 1 b n))

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
    (seach-primes n range)))

(define (search-primes n range)
  (if (> range 0)
    (if (timed-prime-test n)
      (search-primes (+ n 2) (- range 1))
      (search-primes (+ n 2) range))))

; Tests
(search-for-primes 10 100)
(search-for-primes 10000000000 31)
(search-for-primes 100000000000000000000 80)

; Well, it works. But for longer numbers it takes a great
; deal of time to find the primes.
; If we look closer at the original expmod, we can see that
; the remainder keeps the squared number less than m.
; fast-expt, on the other hand, squares huge values.
