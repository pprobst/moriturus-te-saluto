; Exercise 1.5:
; Ben Bitdiddle has invented a test to determine whether the interpreter
; he is faced with is using applicative-order evaluation or norma-order
; evaluation. He defines the following two procedures:

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

; Then he evaluates the expression
(test 0 (p))

; What behavior will Ben observe with an interpreter that uses
; applicative-order evaluaton? What behavior will he observe with
; an interpreter that uses normal-order evaluation? Explain your
; answer. (Assume that the evaluation rule for the special form
; 'if' is the same whether the interpreter is using normal or
; applicative order: The predicate expression is evaluated first,
; and the result determines whether to evaluate the consequent or
; the alternative expression.)


; With applicative-order: evaluate args before function is called 
; (test 0 (p)) never finishes being evaluated (it expands to itself)

; With normal-order: don't evaluate args until you need it
; if (= 0 0) ---> #t
; 0
