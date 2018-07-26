; Exercise 2.74:
; blah blah blah

; a. Implement for headquarters a get-record procedures that retrieves a specified employee's
;    record from a specified personnel file. The procedure should be applicable to any division's
;    file. Explain how the individual divisions' files should be structured. In particular, what
;    type information must me supplied?

; Each division's records have some info as values of the key name. So the files are basically
; lots of key-value records. Of course, each record has a tag attached to it.
(define (get-record employee-name personnel-file)
  (let ((record 
          ((get 'get-record (type-tag personnel-file))
           employee-name
           (contents personnel-file))))
    (if (null? record) 
        #f
        (attach-tag (type-tag personnel-file) record))))

; b. Implement for headquarters a get-salary procedure that returns the salary information
;    from a given employee's record from any division's personnel file. How should the record
;    be structures in order to make this operation work?

(define (get-salary employee-record)
  ((get 'get-salary (type-tag employee-record)) contents record))

; c. Implement for headquarters a find-employee-record procedure. This should search all the
;    divisions' files for the record of a given employee and return the record. Assume that this
;    procedure takes as arguments an employee's name and a list of all the divisions' files.

(define (find-employee-record employee-name file-list)
  (if (null? file-list) 
      #f
      (let ((record (get-record employee-name (car file-list))))
        (if record
            record
            (find-employee-record employee-name (cdr file-list))))))

; d. When Insatiable takes over a new company, what changes must be made in order to incorporate
;    the new personnel information into the central system?
;    ---
;    I believe we'd need to modify the get- procedures so the new info could be represented.


;; I have no idea if this works, so let's try to be imaginative.
