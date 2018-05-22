; Exercise 2.69: 
; The following procedure takes as its argument a list of symbol-frequency pairs
; (where no symbol appears in more than one pair) and generates a Huffman encoding 
; tree according to the Huffman algorithm.

(load "ex2-67.scm")
(load "ex2-68.scm")

(define (generate-huffman-tree pairs)
    (successive-merge 
         (make-leaf-set pairs)))

; Make-leaf-set is the procedure given above that transforms the list of pairs into an 
; ordered set of leaves. Successive-merge is the procedure you must write, using 
; make-code-tree to successively merge the smallest-weight elements of the set until 
; there is only one element left, which is the desired Huffman tree. (This procedure 
; is slightly tricky, but not really complicated. If you find yourself designing a 
; complex procedure, then you are almost certainly doing something wrong. You can take
; significant advantage of the fact that we are using an ordered set representation.)

; See: 
; https://www.siggraph.org/education/materials/HyperGraph/video/mpeg/mpegfaq/huffman_tutorial.html
(define (successive-merge leaf-set)
  (if (null? (cdr leaf-set)) ; repeat until last element
      (car leaf-set)
      (successive-merge
        (adjoin-set (make-code-tree (car leaf-set) (cadr leaf-set))
                    (cddr leaf-set)))))

(define example (generate-huffman-tree
                  '((A 5) (B 7) (C 3) (D 15) (E 20) (F 45))))

(encode '(A B C D E F) example)
