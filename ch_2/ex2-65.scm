; Exercise 2.65:
; Give O(n) implementations union-set and intersection-set for sets 
; implemented as balanced binary trees. 

(load "ex2-63.scm")
(load "ex2-64.scm")

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else
          (let ((x1 (car set1)) (x2 (car set2)))
            (cond
              ((= x1 x2)
               (cons x1 (union-set (cdr set1) (cdr set2))))
              ((> x1 x2)
               (cons x2 (union-set set1 (cdr set2))))
              (else 
                (cons x1 (union-set (cdr set1) set2))))))))

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1 (intersection-set 
                         (cdr set1)
                         (cdr set2))))
              ((< x1 x2) (intersection-set 
                          (cdr set1) 
                          set2))
              ((< x2 x1) (intersection-set 
                          set1 
                          (cdr set2)))))))

(define (union-tree tree1 tree2)
  (list->tree (union-set (tree->list-2 tree1) (tree->list-2 tree2))))

(define (intersection-tree tree1 tree2)
  (list->tree (intersection-set (tree->list-2 tree1) (tree->list-2 tree2))))

;; Tests
(define evens (list->tree '(0 2 4 6 8 10)))
(define odds (list->tree '(1 3 5 7 9)))
(define primes (list->tree '(2 3 5 7 11 13 17 19)))

(union-tree evens odds)
(intersection-tree odds primes)

; I thought this was going to be complicated, but it's actually just a 
; repetition of our previous union and intersection functions, but now
; using with list->tree and tree->list.
; See: https://github.com/ivanjovanovic/sicp/blob/master/2.3/e-2.65.scm
;      http://www.billthelizard.com/2013/03/sicp-263-265-sets-as-binary-trees.html
