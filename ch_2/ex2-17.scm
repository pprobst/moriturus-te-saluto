; Exercise 2.17:
; Define a procedure last-pair that returns the list that contains only
; the last element of a given (nonempty) list.

(define (last-pair l)
  (if (null? (cdr l)
    l
    (last-pair (cdr l)))))

(last-pair (list 1 2 3 4 5 6))
(last-pair (list 1 2))
