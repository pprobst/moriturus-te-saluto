; Exercise 1.44:
; Show how to generate the n-fold smoothed function of any given function
; using smooth and repeated from exercise 1.43.

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
    f
    (compose f (repeated f (- n 1)))))

(define (average a b c)
  (/ (+ a b c) 3))

(define (smooth f dx)
  (lambda (x)
	(average (f x) (f (+ x dx)) (f (- x dx)))))

(define (fold-smooth f dx n)
  (repeated (smooth f dx) n))

; Test with whatever data you have
