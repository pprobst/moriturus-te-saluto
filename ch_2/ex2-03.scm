; Exercise 2.3:
; Implement a representation for rectangles in a plane.
; Create procedures that compute the perimeter and the
; area of a given rectangle. Now implement a different
; representation for rectangles. Can you design a system
; with suitable abstraction barriers, so that the same 
; perimeter and area procedures will work with either 
; represenation?

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (make-segment start-point end-point)
  (cons start-point end-point))

(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

; Rectangle (from 2 opposite corners)
(define (make-rect x y) (cons x y))

(define (rect-area r) 
  (* (rect-base r) (rect-height r)))

(define (rect-perimeter r)
  (* (+ (rect-base r)
        (rect-height r)) 
     2))

(define (rect-base r)
  (abs (- (x-point (car r))
          (x-point (cdr r)))))

(define (rect-height r)
  (abs (- (y-point (car r))
          (y-point (cdr r)))))

; Tests
(define p1 (make-point 2 6))
(define p2 (make-point 4 8))
(define r (make-rect p1 p2))
(rect-area r)
(rect-perimeter r)

; Rectangle2 (from segment connecting 2 corners --> diagonal)
(define (make-rect2 x y) (make-segment x y))

(define (rect-base2 r)
  (abs (- (x-point (start-segment r))
          (x-point (end-segment r)))))

(define (rect-height2 r)
  (abs (- (y-point (start-segment r))
          (y-point (end-segment r)))))

(define (rect-perimeter2 r)
  (* (+ (rect-base2 r)
        (rect-height2 r)) 
     2))

(define (rect-area2 r) 
  (* (rect-base2 r) (rect-height2 r)))

; Tests
(define r2 (make-rect2 p1 p2))
(rect-area2 r2)
(rect-perimeter2 r2)

