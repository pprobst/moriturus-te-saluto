; Exercise 2.86:
; Suppose we want to handle complex numbers whose real parts, imaginary parts, magnitudes, and angles can
; be either ordinary numbers,rational numbers, or other numbers we might wish to add to the system.
; Describe and implement the changes to the system needed to accommodate this. You will have to define 
; operations such as sine and cosine that are generic over ordinary numbers and rational numbers.

(define (sine n) (apply-generic 'sine n))
(define (cosine n) (apply-generic 'cosine n))

; for scheme-number
(put 'sine 'scheme-number
     (lambda (n) (sin n)))
(put 'cosine 'scheme-number
     (lambda (n) (cos n)))

; for rationals
(put 'sine 'rational
     (lambda (n) attach-tag 'rational (sin (/ (car n) (cdr n)))))
(put 'sine 'rational
     (lambda (n) attach-tag 'rational (cos (/ (car n) (cdr n)))))

; we'll need to use the generic add, mul, etc. instead of +, * and so on
