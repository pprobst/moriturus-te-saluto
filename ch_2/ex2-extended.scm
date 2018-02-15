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

; # Exercise 2.11:
; In passin, ben also cryptically comments: "By testing the signs of the
; endpoints of the intervals, it is possible to break mul-interval into nine
; cases, only one of which requires more than two multiplications." 
; Rewrite this procedure using Ben's suggestion.
; What's the point of doing this besides having a much harder time debugging?

; # Exercise 2.12:
; Define a constructor make-center-percent that takes a center and a percentage
; tolerance and produces the desired interval. You must also define a selector
; percent that produces the percentage tolerance for a given interval. The center
; selector is the same as the one shown below.

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c per)
  (make-center-width c (* c (/ per 100.0))))

; # Exercise 2.13:
; Show that under the assumption of small percentage tolerances there is a simple
; formula for the approximate percentage tolerances of the product of two intervals
; in terms of the tolerances of the factors. You may simplify the problem by assuming
; that all numbers are positive.
; PAPER!

; # Exercise 2.14:
; Investigate the behavior of the system on a variety of arithmetic expressions.
; Make some intervals A and B. You will get the most insight by using intervals 
; whose width is a small percentage of the center value. Examine the results of the 
; computation in center-percent form (see exercise 2.12).

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))


(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval 
      one (add-interval (div-interval one r1)
                        (div-interval one r2)))))

; See "Tests" section!

; # Exercise 2.15:
; Eva Lu Ator (lol) says that a formula to compute with intervals using Alyssa's 
; system will produce tighter error bound if it can be written in such a form 
; that no variable that represents an uncertain number is repeated. Thus,
; she says par2 is a "better" program for parallel resistances than par1.
; Is she right? Why?
; PAPER! (Eva Lu Ator is right though)

; # Exercise 2.16:
; Explain, in general, why equivalent algebraic expressions may lead to different
; answers. Can you devise an interval-arithmetic package that does not have this
; shortcoming, or is this task impossible?
; I answered this on paper with Exercise 2.15, but basically it's a problem of
; representation: algebraically speaking, it's correct to assume that R/R = 1.
; But R in this case is an interval, and dividing two equal intervals does not
; equals 1.
; About the second question: I honestly have no idea right now. Need to research.

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
(define A (make-center-percent 30 4))
(define B (make-center-percent 40 2))
(define A/A (div-interval A A))
A/A
(define B/B (div-interval B B))
B/B
(center A/A)
(center B/B)

(define ABPAR1 (par1 A B))
ABPAR1
(define ABPAR2 (par2 A B))
ABPAR2
; Different results!
(center ABPAR1)
(center ABPAR2)
