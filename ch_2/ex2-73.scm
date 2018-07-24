; Exercise 2.73:
; Section 2.3.2 described a program that performs symbolic differentiation:

(define (deriv exp var)
  (cond ((number? exp) 0)
		((variable? exp) (if (same-variable? exp var) 1 0))
		((sum? exp)
		 (make-sum (deriv (addend exp) var)
				   (deriv (augend exp) var)))
		((product? exp)
		 (make-sum
		   (make-product (multiplier exp)
						 (deriv (multiplicand exp) var))
		   (make-product (deriv (multiplier exp) var)
						 (multiplicand exp))))
		; <more rules can be added here>
		(else (error "unknown expression type: DERIV" exp))))

; We can regard this program as performing a dispatch on the type of the expression to be
; differentiated. In this situation the "type tag" of the datum is the algebraic operator
; symbol (such as +) and the operation being performed is deriv. We can transform this
; program into data-directed style by rewriting the basic derivative procedure as

(define (deriv exp var)
  (cond ((number? exp) 0)
		((variable? exp) (if (same-variable? exp var) 1 0))
		(else ((get 'deriv (operator exp))
			   (operands exp) var))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

; a. Explain what was done above. Why can't we assimilate the predicates "number?" and 
;    "variable?" into the data-directed dispatch?
;    ----------------------------------------------------------------------------------------
;    Apparently we filled a table with the procedures we'll need for deriv. The code above
;    "loads" the correct procedure given the operators and operands.
;    We can't assimilate "number?" and "variable?" because they don't use operators and 
;     operands.
;    ----------------------------------------------------------------------------------------

; b. Write the procedures for derivatives of sums and products, and the auxiliary code 
;    required to install them in the table used by the program above.
;    ----------------------------------------------------------------------------------------

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2))
         (+ a1 a2))
        (else (list '+ a1 a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

(define install-deriv-sum
  (define (addend s) (car s))
  (define (augend s)
    (if (null? (cddr s))
        (car s)
        (cons '+ (cdr s))))
  (define (deriv-sum s var) 
    (make-sum 
      (deriv (addend s) var) 
      (deriv (augend s) var)))
  (put '+ 'deriv deriv-sum))

(define install-deriv-product
  (define (multiplier p) (car p))
  (define (multiplicand p)
    (if (null? (cddr p))
        (car p)
        (cons '* (cdr p))))
  (define (deriv-product p var) 
    (make-sum
      (make-product (multiplier p)
                    (deriv (multiplicand p) var))
      (make-product (multiplicand p)
                    (deriv (multiplier p) var))
      var))
  (put '* 'deriv deriv-product))

;    ----------------------------------------------------------------------------------------
; c. Choose any additional differentiation rule that you like, such as the one for exponents
;    (exercise 2.56) and install it in this data-directed system.
;    ----------------------------------------------------------------------------------------
;    Eh, it's almost the same thing as above.
;    ----------------------------------------------------------------------------------------
; d. In this simple algebraic manipulator the type of an expression is the algebraic operator
;    that binds it together. Suppose, however, we indexed the procedures in the opposite way,
;    so that the dispatch line in deriv looked like
;    ((get (operator exp) 'deriv) (operands exp) var)
;    What corresponding changes to the derivative system are required?
;    ----------------------------------------------------------------------------------------
;    We only need to change the order of the arguments in each put.
;    ----------------------------------------------------------------------------------------

