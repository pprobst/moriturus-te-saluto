; Exericise 2.45:
; right-split and up-split can be expressed as instances of a general
; splitting operation. Define a procedure split with the property that
; evaluating
; (define right-split (split beside below))
; (define up-split (split below beside))
; produces procedures right-split and up-split with the same behaviors
; as the ones already defined.

(define (split f1 f2)
  (define (aux painter n)
    (if (= n 0)
        painter
        (let ((smaller (rec painter (- n 1))))
          (f1 painter (f2 smaller smaller)))))
    aux)
