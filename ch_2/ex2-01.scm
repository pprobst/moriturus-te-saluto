; Exercise 2.1:
; Define a better version of make-rat that manipulates both positive and
; negative numbers.

(define (make-rat n d)
  (let ((g (gcd n d)))
	(if (< d 0)
	  (cons (/ (* n -1) g) (/ (* d -1) g))
	  (cons (/ n g) (/ d g)))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define num1 (make-rat -1 -3))
(print-rat num1)
(define num2 (make-rat -1 3))
(print-rat num2)
(define num3 (make-rat 1 -3))
(print-rat num3)
