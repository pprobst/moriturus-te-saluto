; Exercise 1.45:

; I had no idea how to do this initially, so I consulted 
; http://www.billthelizard.com/2010/08/sicp-145-computing-nth-roots.html
; (read it!)

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (average x y) 
  (/ (+ x y) 2))

 (define (average-damp f) 
   (lambda (x) (average x (f x)))) 

(define (compose f g)
  (lambda (x) (f (g x))))

; "In order to calculate the number of average damps from n, we just need to 
; take the log2 of n then floor the result."
(define (log2 x)
    (/ (log x) (log 2)))

(define (repeated f n)
  (if (= n 1)
    f
    (compose f (repeated f (- n 1)))))

(define (nth-root x n)
  (fixed-point 
	((repeated average-damp (floor (log2 n))) 
	 (lambda (y) (/ x (expt y (- n 1))))) 
	1.0))

(nth-root 1000 4) 
(nth-root 256 8)
