; Exercise 2.70: 
; The following eight-symbol alphabet with associated relative frequencies was designed
; to efficiently encode the lyrics of 1950s rock songs. (Note that the “symbols” of an 
; “alphabet” need not be individual letters.)

; A    2    NA  16
; BOOM 1    SHA  3
; GET  2    YIP  9
; JOB  2    WAH  1

; Get a job
; Sha na na na na na na na na

; Get a job
; Sha na na na na na na na na

; Wah yip yip yip yip 
; yip yip yip yip yip
; Sha boom

; How many bits are required for the encoding? What is the smallest number of bits that
; would be needed to encode this song if we used a fixed-length code for the eight-symbol 
; alphabet?

; (load "ex2-67.scm")
; (load "ex2-68.scm")
(load "ex2-69.scm")

(define freqs
  '((A 2) (BOOM 1) (GET 2) (JOB 2) (NA 16) (SHA 3) (YIP 9) (WAH 1)))

(define shanana 
  '(Get a job Sha na na na na na na na na Get a job Sha na na na na na na na na Wah yip yip yip yip yip yip yip yip yip Sha boom))

(define huff-freqs (generate-huffman-tree freqs))

(define encoded-song (encode shanana huff-freqs))
(length encoded-song)
(* 3 (length shanana))

; Optimal: 84
; Fixed-length encoding: (* 3 (length shanana)) = 108
; Why 3? 8 = 2^3
