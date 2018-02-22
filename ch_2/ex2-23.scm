; Exercise 2.23:
; The procedure for-each is similar to map. It takes as arguments a procedure
; and a list of elements. However, rather than forming a list of the results,
; for-each just applies the procedure to each of the elements in turn, from
; left to right. The values returned by appplying the procedure to the elements
; are not used at all -- for-each is used with procedures that perform an action,
; such as printing. For example,

; (for-each (lambda (X)
;             (newline)
;             (display x))
;           (list 57 321 88))

; The value returned by the call to for-each can be sometihing arbitrary, such
; as true. Give an implementation of for-each.

(define (muh-for-each f items)
  (if (not (null? items)) 
    (begin 
      (f (car items))
      (muh-for-each f (cdr items)))
    #t))

(muh-for-each (lambda (x) 
                (newline) 
                (display x))
              (list 57 321 88))
