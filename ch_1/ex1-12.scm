; Exercise 1.12:
; The following pattern of numbers is called Pascal's triangle.


;				1
;			1		1
;		1		2		1
;	1		3		3		1
;1		4		6		4		1
;			.	.	.

; Write a procedure that computes elements of Pascal's triangle 
; by means of a recursive process.

; We can find any element of Pascal's triangle by doing
; C(n, r) = n!/(r!(n-r)!)

(define (pascal n r)
  (define (find-elem n r)
	(if (or (= n 0) (= n r))
	  1
	  (/ (fact n)
	     (* (fact r) (fact(- n r))))))
  (find-elem n r))


(define (fact n)
  (if (= n 1)
	1
	(* n (fact (- n 1)))))

; Tests
(pascal 1 1)
(pascal 2 1)
(pascal 3 3)
(pascal 4 2)
(pascal 5 3)
(pascal 6 1)
