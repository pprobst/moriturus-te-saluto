; Exercise 2.49:
; Use segments->painter to define the following:
; a) The painter that draws the outline of the designated frame.
; b) The painter that draws an "X" by connecting the opposite
;    corners of the frame.
; c) The painter that draws a diamond shape by connecting midpoints
;    of the sides of the frames.
; d) The 'wave' painter.

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

; Segments
(define (make-segment v1 v2)
  (cons v1 v2))

(define (start-segment v)
  (car v))

(define (end-segment v)
  (cdr v))

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
      (origin-frame frame)
      (add-vect (scale-vect (xcor-vect v) (edge1-frame frame))
                (scale-vect (ycor-vect v) (edge2-frame frame))))))

; Segments->Painter
(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
      (lambda (segment)
        (draw-line
          ((frame-coord-map frame)
           (start-segment segment))
          ((frame-coord-map frame)
           (end-segment segment))))
      (segment-list))))

; ----------------------------------------- ;

; Painters
; This is literally just make-segments.
(define outline-seg 
  (list 
    (make-segment (make-vect 0 0) (make-vect 0 1))
    (make-segment (make-vect 0 1) (make-vect 1 1))
    (make-segment (make-vect 1 1) (make-vect 1 0))
    (make-segment (make-vect 1 0) (make-vect 0 0))))

(define x-seg
  (list 
    (make-segment (make-vect 0 0) (make-vect 1 1))
    (make-segment (make-vect 0 1) (make-vect 1 0))))

(define outline (segments->painter outline-seg))
(define x (segments->painter x-seg))

; The other two are very similar, just draw the segments on 
; paper then translate them to Scheme.
; Probably should test this on Racket, using pict language.
