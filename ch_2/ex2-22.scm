; Exercise 2.22:
; Louis Reasoner tries to rewrite the first square-list procedure of 
; Exercise 2.21 so that it evolves an iterative process:

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
            (cons (square (car things)) answer))))
  (iter items '()))

; This doesn't work because it keeps placing the squared number to the 
; *front* of the list.

; Unfortunately, defining square-list this way produces the answer list
; in the reverse order of the one desired. Why?
; Louis then tries to fix his bug by interchanging the arguments to cons:

(define (square-list-rev items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
            (cons answer (square (car things))))))
  (iter items '()))

; This doesn't work (even more) because arguments of cons are swapped;
; now answer is a list and we'll have a list of a list...

(square-list (list 1 2 3 4))
(square-list-rev (list 1 2 3 4))

; Fixed version
(define (square-list-rev2 items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
            (append answer (list (square (car things)))))))
  (iter items '()))

(square-list-rev2 (list 1 2 3 4))


