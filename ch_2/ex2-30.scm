; Exercise 2.30:
; Define a procedure square-tree analogous to the square-list procedure
; of exercise 2.21.

(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree sub-tree)
             (* sub-tree sub-tree)))
       tree))

(define (square-tree-directly tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree-directly (car tree))
                    (square-tree-directly (cdr tree))))))

(square-tree
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))

(square-tree-directly
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))
