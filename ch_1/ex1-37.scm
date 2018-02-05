; Exercise 1.37:
; Suppose that n and d are procedures of one argument (the term
; index i) that return the Ni and Di of the terms of the continued
; fraction. Define a procedure cont-frac such that evaluating
; (cont-frac n d k) computes the value of the k-term finite
; continued fraction. Check your procedure by approximating
; 1/phi using

;(cont-frac (lambda (i) 1.0)
;           (lambda (i) 1.0)
;           k)

; for successive values of k. How large must you make k in order
; to get an approximation that is accurate to 4 decimal places
; If your cont-frac procedure generates a recursive process, write
; one that generates an iterative process. If not, do the opposite.

; Iterative version
(define (cont-frac n d k)
  (define (iter i res) ; i = term
    (if (= i 0)
      res
      (iter (- i 1) (/ (n i) (+ (d i) res)))))
  (iter k 0))

; Recursive version
(define (cont-frac-rec n d k i)
  (if (= i k)
    (/ (n k) (d k))
    (/ (n i) (+ (d i) (cont-frac-rec n d k (+ i 1))))))

; Tests
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           5)

(cont-frac-rec (lambda (i) 1.0)
               (lambda (i) 1.0)
               5
               1)
