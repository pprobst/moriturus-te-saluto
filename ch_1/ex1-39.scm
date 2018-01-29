; Exercise 1.39:
; Define a procedure (tan-cf x k) that computes an approximation
; to the tangent function based on Lambert's formula. k specifies
; the number of terms to compute, as in exercise 1.37

; Ni --> if i == 1 --> x
;        else --> -x²
; Di --> definition of odd --> Di = 2i-1

(define (cont-frac n d k)
  (define (iter i res) ; i = term
    (if (= i 0)
      res
      (iter (- i 1) (/ (n i) (+ (d i) res)))))
  (iter k 0))

(define (square x)
  (* x x))

(define (tan-cf x k)
  (cont-frac (lambda (i) 
               (if (= i 1)
                 x
                 (- (square x))))
             (lambda (i)
               (- (* 2 i) 1))
             k))

(tan-cf 3.14159 1000)
(tan 3.14159)
