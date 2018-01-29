; Exercise 1.38:
; Write a program that uses your cont-frac procedure from
; exercise 1.37 to approximate e, based on Euler's expansion

; e - 2 --> Ni = 1; 
;           Di = 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, ...
;           Di = {{1,2,3}, {1,4,1}, {1,6,1}, {1, 8, 1}...}
;           We can check if i is the middle number by checking
;           i % 3; if (i % 3 == 2) --> it's the middle number!
;                  else --> it's 1!

(define (cont-frac n d k)
  (define (iter i res) ; i = term
    (if (= i 0)
      res
      (iter (- i 1) (/ (n i) (+ (d i) res)))))
  (iter k 0))

(define (euler-frac k)
  (+ 2 
     (cont-frac (lambda (i) 1.0) 
                (lambda (i)
                  (if (= (remainder i 3) 2)
                    (* 2 (/ (+ i 1) 3))
                    1))
                k)))

(euler-frac 10.0)
