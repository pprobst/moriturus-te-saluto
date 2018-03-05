; Exercise 2.31: Abstract your answer to exercise 2.30 to produce a procedure
; tree-map with the property that square-tree could be defined as
; (define (square-tree tree) (tree-map square tree))

(define (tree-map f tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map f sub-tree)
             (f sub-tree)))
       tree))

(define (square-tree tree) (tree-map square tree))

(square-tree 
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))

