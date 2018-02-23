; Exercise 2.25:
; Give combinations of cars and cdrs that will pick 7 from each of
; the following lists:

(define list1 (list 1 3 (list 5 7) 9))
(define list2 (list (list 7)))
(define list3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

(define (solve-list1 l1)
  (car (cdr (car (cdr (cdr l1))))))

(define (solve-list2 l2)
  (car (car l2)))

(define (solve-list3 l3)
  (car (cdr l3)))

(solve-list1 list1)
(solve-list2 list2)
(solve-list3 list3)
