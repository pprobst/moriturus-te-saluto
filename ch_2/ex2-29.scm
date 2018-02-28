; Exercise 2.29:
; A binary mobile consists of two branches, a left branch and a right branch.
; Each branch is a rod of a certain length, from which hangs either a weight
; or another binary mobile. We can represent a binary mobile using compound 
; data by constructing it from two branches (for example, using list):

(define (make-mobile left right)
  (list left right))

; A branch is constructed from a length (which must be a number) together
; with a structure, which may be either a number (representing a single weight)
; or another mobile:

(define (make-branch length structure)
  (list length structure))

; (A) Write the corresponding selectors left-branch and right-branch, which
; return the branches of a mobile, and branch-length and branch-structure,
; which returns the components of a branch.

(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (cadr mobile))
(define (branch-length branch) (car branch))
(define (branch-structure branch) (cadr branch))

; (B) Using your selectors, define a procedure total-weight that returns
; the total weight of a mobile.

; I initially had trouble writing this part, but after searching other people's
; solutions I realized that the secret is just to stick with the definition!
; Write it in the most obvious way possible.

(define (branch-weight branch)
  (if (not (pair? (branch-structure branch)))
      (branch-structure branch)
      (total-weight (branch-structure branch))))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

; (C) A mobile is said to be balanced if the torque applied by its top-left
; branch is equal to that applied by its top-right branch (that is, if the 
; length of the left rod multiplied by the weight hanging from that rod is equal
; to the corresponding product for the right side) and if each of the submobiles
; hanging off its branches is balanced. Design a predicate that tests wheter a
; binary mobile is balanced.

(define (torque branch)
  (* (branch-length branch)
     (branch-weight branch)))

(define (balanced? mobile)
  (= (torque (left-branch mobile)) 
     (torque (right-branch mobile))))

(define a (make-mobile (make-branch 5 2) (make-branch 5 2)))
(define b (make-mobile (make-branch 6 6) (make-branch 3 3)))
(total-weight a)
(total-weight b)
(balanced? a)
(balanced? b)

; (D) Suppose we change the representation of mobiles so that the constructors are:

; (define (make-mobile left right) (cons left right)
; (define (make-branch length structure)
;   (cons length structure))

; How much do you need to change your programs to convert the new representation?
; Answer: Not much. As the functions above are defined in therms of branches,
; we need to change how we define branches
; (define (right-branch mobile) (cdr mobile))
; (define (branch-structure branch) (cdr branch))
