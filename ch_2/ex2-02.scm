; Exercise 2.2:
; Consider the problem of representing line segments in a plane.
; Define a constructor make-segment and selectors start-segment and
; end-segment that represent the line segment in terms of points.
; Furthermore: x and y can be represented as a pair of numbers.
; Accordingly, specify a constructor make-point and selectors x-point
; and y-point.
; Finally, using your selectors and constructors, define a procedure 
; midpoint-segment that takes a line and returns its midpoint.

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (make-segment start-point end-point)
  (cons start-point end-point))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define (avg a b) (/ (+ a b) 2.0))

(define (midpoint-segment s)
  (make-point (avg (x-point (start-segment s)) (x-point (end-segment s)))
			  (avg (y-point (start-segment s)) (y-point (end-segment s)))))

(define (print-point p) 
  (newline) 
  (display "(") 
  (display (x-point p)) 
  (display ",") 
  (display (y-point p)) 
  (display ")")) 

; Test
(define p1 (make-point 1 6))
(define p2 (make-point 1 12))
(define seg (make-segment p1 p2))
(define mid (midpoint-segment seg))
(print-point mid)
