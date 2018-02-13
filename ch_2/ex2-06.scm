; Exercise 2.6:

(define zero (lambda (f) (lambda (x) x)))


(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; This representations is known as 'Church numerals', after its inventor,
; Alonzo Church, the logician who invented lambda-calculus.
; (wtf)
; Define 'one' and 'two' directly (not in terms of zero and add-1).
; Give a direct definition of the addition procedure + (not in terms of
; repeated application of add-1).

; (add-1 zero) is one
; (lambda (f) (lambda (x) (f ((zero f) x))))
; (lambda (f) (lambda (x) (f x))) --> one
; (add-1 one) is two
; (lambda (f) (lambda (x) (f ((one f) x))))
; (lambda (f) (lambda (x) (f ((lambda (f) (lambda (x) (f x)) f) x))))
; (lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
; (lambda (f) (lambda (x) (f (f x)))) --> two

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))
