; Exercise 1.32:
; Show that sum and product are both special cases of a still
; more general notion called accumulate that combines a collection
; of terms, using some general accumulation function:

; (accumulate combiner null-value term a next b)

; accumulate takes as arguments the same term and range specifications
; as sum and product, together with a combiner procedure (of
; two arguments) that specifies how the current term is to be
; combined with the accumulation of the preceding terms and a
; null-value that specifies what base value to use when the 
; terms run out. 
; Write accumulate and show how sum and product can both be
; defined as simple calls to accumulate.

; If your accumulate procedure generates a recursive process,
; write one that generates an iterative process. Do the opposite
; if not.


; Accumulate procedure
(define (accumulate combiner null-value term a next b)
  (if (> a b) 
    null-value
    (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a res)
    (if (> a b) 
      res
      (iter (next a) (combiner res (term a)))))
  (iter a null-value))

; Auxiliar procedures
(define (identity n) n)
(define (inc n) (+ n 1))

; Sum & product
(define (sum term a next b bool)
  (if (= bool 0)
    (accumulate + 0 term a next b)
    (accumulate-iter + 0 term a next b)))

(define (product term a next b bool)
  (if (= bool 0)
    (accumulate * 1 term a next b)
    (accumulate-iter * 1 term a next b)))

(define (sum-integers a b bool)
  (sum identity a inc b bool))

(define (product-integers a b bool)
  (product identity a inc b bool))

; Tests (3rd parameter == 0 --> recursive)
;       (              != 0 --> iterative)
(sum-integers 1 10 0)
(product-integers 1 10 1)
