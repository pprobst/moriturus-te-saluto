; Exercise 2.5:
; Show that we can represent pairs of nonnegative integers using only
; numbers and arithmetic operations if we represent the pair a and b
; as the integer that is the product (2^a)(3^b). Give the corresponding
; definitions of the procedures cons, car and cdr.

(define (muh-cons x y) 
  (* (expt 2 x) (expt 3 y)))

(define (muh-car x) (num-of-divs x 2))
(define (muh-cdr x) (num-of-divs x 3))

(muh-cons 3 4)

; Notice that 'muh-cons 3 4' returns the value 648. With car and cdr, we
; need to operate on this number until we find what the original value
; was. But how do we do that?
; If we want to find car: take a calculator and divide 648 by 2 until it
; stops showing whole values. 
; If we want to find cdr: same as above, but dividing by 3.

(define (num-of-divs n div)
  (define (iter x res)
    (if (= 0 (remainder x div))
      (iter (/ x div) (+ res 1))
      res))
  (iter n 0))

(muh-car (muh-cons 3 4))
(muh-cdr (muh-cons 3 4))
(muh-car (muh-cons 132 24))
(muh-cdr (muh-cons 132 24))
