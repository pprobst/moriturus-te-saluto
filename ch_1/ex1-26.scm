; Exercise 1.26
; bla bla bla

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base
                        (expmod base (- exp 1) m))
                     m))))

; "By writing the procedure like that, you have transformed
; the O(log n) process into a O(n) process."
; Explain.

(define (square n)
  (* n n))

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

; We need to compare both expmod procedures we saw --
; the newer (above) and the older (ex1-24).
; Doing the same test, we can observe that it takes significant
; more time to calculate the primes. Why does this happen?

; In the newer procedure, instead of using square, we do
; direct multiplication (line 7). Using direct multiplication
; instead of square, we can see that expmod is executed 2 times
; more.
; Besides, it's not a tree recursion instead of a linear recursion.
