; Exercise 2.47:
; Here are two possible constructor for frames:

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (make-frame2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

; For each constructor supply the appropriate selectors to produce
; an implementation for frames.

(define (origin frame)
  (car frame))

(define (edge1 frame)
  (cadr frame))

(define (edge2 frame)
  (caddr frame))  ; for make-frame
  ; (cddr frame)) ; for make-frame2
