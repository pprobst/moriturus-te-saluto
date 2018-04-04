; Exercise 2.46:
; A 2D   vector v running from the origin to a point can be represented
; as a pair consisting of an x-coordinate and a y-coordinate. Implement
; a data abstraction for vector by giving a constructor make-vect and 
; corresponding selectors xcor-vect and ycor-vect. In terms of your
; selectors and constructor, implement procedures 'add-vect', 'sub-vect',
; and 'scale-vet' that perform the operations vector addition, vector
; subtraction and multiplying a vector by a scalar.

; Constructor and selectors
(define (make-vect x y)
  (cons x y))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cdr v))

; Arithmetic ops
(define (add-vect v1 v2)
  (make-vect 
    (+ (xcor-vect v1) (xcor-vect v2)) 
    (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect 
    (- (xcor-vect v1) (xcor-vect v2)) 
    (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect v scalar)
  (make-vect
    (* (xcor-vect v) scalar)
    (* (ycor-vect v) scalar)))

; Tests
(define v1 (make-vect 1 2))
(define v2 (make-vect 2 2))
(add-vect v1 v2)
(sub-vect v1 v2)
(scale-vect v1 5)
