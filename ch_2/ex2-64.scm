; Exercise 2.64: 
; The following procedure list->tree converts an ordered list to a balanced
; binary tree. The helper procedure partial-tree takes as arguments an 
; integer n and list of at least n elements and constructs a balanced tree
; containing the first n elements of the list. The result returned by 
; partial-tree is a pair (formed with cons) whose car is the constructed
; tree and whose cdr is the list of elements not included in the tree.

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size 
             (quotient (- n 1) 2)))
        (let ((left-result 
               (partial-tree 
                elts left-size)))
          (let ((left-tree 
                 (car left-result))
                (non-left-elts 
                 (cdr left-result))
                (right-size 
                 (- n (+ left-size 1))))
            (let ((this-entry 
                   (car non-left-elts))
                  (right-result 
                   (partial-tree 
                    (cdr non-left-elts)
                    right-size)))
              (let ((right-tree 
                     (car right-result))
                    (remaining-elts 
                     (cdr right-result)))
                (cons (make-tree this-entry 
                                 left-tree 
                                 right-tree)
                      remaining-elts))))))))

; 1) Write a short paragraph explaining as clearly as you can how partial-tree 
; works. Draw the tree produced by list->tree for the list (1 3 5 7 9 11).
; -/-
; R: The best way to understand this algorithm is to first understant how a binary
; tree generally works. A binary tree has three "major" parts: 
; - The root of the tree
; - The left side of the tree  (< root)
; - The right side of the tree (> root)
; Basically, partial-tree breaks the received list into the three "parts"
; described above, and finally genrates the root with the left and right branches.
; 
;   _5_
;  /    \
;  1     9
;   \   / \
;    3 7   11

; 2) What is the order of growth in the number of steps required by list->tree 
; to convert a list of n elements?
; -/-
; R: - partial-tree breaks the list in half at each call
;    - the process done to break the list takes constant time
;    - each element is visited one time
;    - cons each visited element
;    T(n) = 2*T(n/2) + O(1)
;    --> O(n).
