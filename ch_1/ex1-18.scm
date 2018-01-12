; Exercise 1.18:
; Using the results of ex1-16 and ex1-17, devise a procedure
; that generates an iterative process for multiplying two
; integers in terms of adding, doubling, and halving and 
; uses a logarithmic number of steps.

; I noticed that there's a footnote talking about the
; "Russian peasant method". I readily searched about it
; and found a great chunk of info at the following URLs:
; http://mathforum.org/dr.math/faq/faq.peasant.html
; https://en.wikipedia.org/wiki/Ancient_Egyptian_multiplication#Russian_peasant_multiplication
; I'll implement the method here.

(define (even? x)
  (= (remainder x 2) 0))

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (russian-mult a b)
  (if (< a b) 
    (mult-iter a b 0)
    (mult-iter b a 0)))

(define (mult-iter a b sum)
  (cond ((= b 0) sum)
        ((even? b) (mult-iter (double a) (halve b) sum))
        (else (mult-iter (double a) (- (halve b) 0.5) (+ sum a)))))

; Tests
(russian-mult 5 5)
(russian-mult 2 7)
(russian-mult 50 4)
(russian-mult 1 5)
(russian-mult 7 6)
