; Exercise 1.35:
; Show that the Golden Ratio phi is a fixed point of the transformation
; x --> 1 + 1/x, and use this fact to compute by means of the
; fixed-point procedure.

; phi² = phi + 1
; phi = sqrt(phi + 1)

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(fixed-point (lambda (x) (sqrt(+ x 1))) 1.0)
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
