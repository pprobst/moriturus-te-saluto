; Exercise 2.68: 
; The encode procedure takes as arguments a message and a tree and produces the 
; list of bits that gives the encoded message.

(load "ex2-67.scm")

(define (encode message tree)
  (if (null? message)
      '()
      (append 
        (encode-symbol (car message) 
                       tree)
        (encode (cdr message) tree))))

; Encode-symbol is a procedure, which you must write, that returns the list of 
; bits that encodes a given symbol according to a given tree. You should design 
; encode-symbol so that it signals an error if the symbol is not in the tree 
; at all. Test your procedure by encoding the result you obtained in Exercise 
; 2.67 with the sample tree and seeing whether it is the same as the original 
; sample message.

; memq returns false if the item is not in the list; list otherwise

(define (encode-symbol symbol tree)
  (cond ((not (memq symbol (symbols tree)))
         (error "símbolo malvado" symbol))
        ((leaf? tree) 
         '())
        ((memq symbol (symbols (left-branch tree)))
         (cons 0 (encode-symbol symbol (left-branch tree))))
        (else
          (cons 1 (encode-symbol symbol (right-branch tree))))))

(encode '(A D A B B C A) sample-tree)


