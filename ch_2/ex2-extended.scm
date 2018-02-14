; EXTENDED EXERCISE: INTERVAL ARITHMETIC

; # Exercise 2.7:
; (read 2.1.4)

(define (spans-zero y)
  (and (>= (upper-bound y) 0)
       (<= (lower-bound y) 0)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (spans-zero y) (error "Interval spans 0!")
  (mul-interval 
    x
    (make-interval (/ 1.0 (upper-bound y))
                   (/ 1.0 (lower-bound y))))))

; Alyssa's program is incomplete because she has not specified the
; implementation of the interval abastraction. Here is a definition
; of the interval constructor:

(define (make-interval a b) (cons a b))

; Define selector upper-bound and lower-bound to complete the
; implementation.

(define (upper-bound a) (cdr a))
(define (lower-bound a) (car a))


; # Exercise 2.8:
; Using reasoning analogous to Alyssa's, describe how the difference
; of two intervals may be computed. Define a corresponding subtraction
; procedure, called sub-interval.
; https://en.wikipedia.org/wiki/Interval_arithmetic#Simple_arithmetic
; Same as add-interval, but using subtraction instead of addition.

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))


; # Exercise 2.9:
; The width of and interval is half of the difference between its upper
; and lower bounds.
; Show that the width of the sum (or difference) of two intervals is a
; function only of the widths of the intervals being added (or subtracted).
; Give examples to show that this is not true for multiplication or division.
; DONE ON PAPER!

; # Exercise 2.10:
; Ben Bitdiddle, an expert systems programmer, looks over Alyssa's shoulder
; and comments that it is not clear what it means to divide by an interval
; that spans zero. Modify Alyssa's code to check for this condition and to
; signal an error if it occurs.
; OK.

; Tests
(define int1 (make-interval 20 30))
(define int2 (make-interval 5 10))
(add-interval int1 int2)
(mul-interval int1 int2)
(div-interval int1 int2)
(sub-interval int1 int2)
;(define int3 (make-interval 6 15))
;(define int4 (make-interval -6 16))
;(div-interval int3 int4)
