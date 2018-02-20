; Exercise 2.18:
; Define a procedure reverse that takes a list as argument and returns
; a list of the same elements in reverse order.


(define (reverse l)
  (if (null? l)
    l
    (append (reverse (cdr l)) (list (car l)))))

(reverse (list 1 2 3 4))
