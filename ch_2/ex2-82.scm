; Exercise 2.82:
; Show how to generalize apply-generic to handle coercion in the general case of multiple arguments.
; One strategy is to attempt to coerce all the arguments to the type of the first argument, then to
; the type of the second argument, and so on. Give an example of a situation where this strategy (and
; likewise the two-argument version given above) is not sufficiently general. (Hint: Consider the case
; where there are some suitable mixed-type operations present in the table that will not be tried.)

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (can-corce? type-tags)
              (; do some unknown stuff))
                               (error "No method for these types"
                                      (list op type-tags))))))
                   (error "No method for these types"
                          (list op type-tags)))))))

  (define (can-coerce? types)
    (not (or (null? types) 
             (every lambda (type) (equal? type (car types))) types))))
