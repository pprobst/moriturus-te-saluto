; Exercise 2.63:
; Each of the following two procedures converts a binary tree to a list.

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 
                      (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list 
                              (right-branch tree)
                              result-list)))))
  (copy-to-list tree '()))

; Tree procedures
(define (entry tree) (car tree))  
(define (left-branch tree) (cadr tree)) 
(define (right-branch tree) (caddr tree)) 
(define (make-tree entry left right)
  (list entry left right)) 

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((=  x (entry set) true))
        ((< x (entry set))
         (element-of-set? x (left-branch set)))
        ((> x (entry set))
         (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set))
         (make-tree (entry set)
                    (adjoin-set x (left-branch set))
                    (right-branch set)))
        ((> x (entry set))
         (make-tree (entry set)
                    (left-branch set)
                    (adjoin-set x (right-branch set))))))

; Questions

; a) Do the two procedures produce the same result for every tree? If not, how
; do the results differ? What lists do the two procedures produce for the trees
; in figure 2.16?
; -
; R:  
(define tree-1 (make-tree 7
                          (make-tree 3
                                     (make-tree 1 '() '())
                                     (make-tree 5 '() '()))
                          (make-tree 9 '()
                                     (make-tree 11 '() '()))))

(define tree-2 (make-tree 3
                          (make-tree 1 '() '())
                          (make-tree 7
                                     (make-tree 5 '() '())
                                     (make-tree 9 '() 
                                                (make-tree 11 '() '())))))

(define tree-3 (make-tree 5
                          (make-tree 3
                                     (make-tree 1 '() '())
                                     '())
                          (make-tree 9
                                     (make-tree 7 '() '())
                                     (make-tree 11 '() '()))))

(tree->list-1 tree-1) 
(tree->list-2 tree-1) 
(tree->list-1 tree-2) 
(tree->list-2 tree-2) 
(tree->list-1 tree-3) 
(tree->list-2 tree-3) 

; The produced results are the same. Both procedures are implemented so that
; the input order is respected. That is, the traversal is in-order.

; b) Do the two procedures have the same order of growth in the number of steps
; required to convert a balanced tree with n elements to a list? If not, which
; one grows more slowly?
; -
; R: Yes.
; The second procedure is O(n), because it uses cons (a constant operation) at
; each step.
; T(n) = 2*T(n/2) + O(1)
; T(n) = O(n)

; However, the first procedure is O(n*logn) because it uses append, which has
; an order of growth proportional to the passed argument. Also note that in 
; each call to append, n is cut in half. 
; T(n) = 2*T(n/2) + O(n/2)
; T(n) = O(n*logn)
