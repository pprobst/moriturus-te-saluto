; Exercise 2.87:
; Install =zero? for polynomials in the generic arithmetic package. This will allow adjoin-terms to work
; for polynomials with coefficients that are themselves polynomials.

(put 'zero? 'polynomial
     (lambda (p) (empty-termlist? term-list p)))


