; Exercise 2.88:
; Extend the polynomial system to include subtraction of polynomials.
; (Hint: you may find it helpful to define a generic negation operation.)

; Re-reading past exercises makes this easier...
(define (add-terms L1 L2)
  ; ...
  ; ...
  )

(put 'negate '...)

(define (negate-terms terms)
  (if (empty-termlist? terms)
      (the-empty-termlist)
      (adjoin-term
        (make-term (order (first-term terms)) 
                          (negate (coeff (first-term terms))))
        (negate-terms (rest-terms terms)))))

(define (sub-poly p1 p2)
  (add-poly p1 (negate p2)))
