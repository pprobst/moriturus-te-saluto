; Exercise 2.61: 
; Give an implementation of adjoin-set using the ordered representation. 
; By analogy with element-of-set? show how to take advantage of the ordering
; to produce a procedure that requires on the average about half as many steps 
; as with the unordered representation.

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

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

(define (adjoin-set x set)
  (cond ((or (null? set) (< x (car set))) 
         (cons x set)) 
        ((= x (car set)) 
         set)
        ((> x (car set)) 
         (cons (car set) (adjoin-set x (cdr set))))))

; Tests
(define set1 (list 1 4 7 12))
(adjoin-set 2 set1)
(adjoin-set 14 set1)
