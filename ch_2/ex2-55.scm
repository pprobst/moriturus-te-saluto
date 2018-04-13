; Exercise 2.55
; Eva Lu Ator types to the interpreter the expression

(car ''abracadabra)

; To her surprise, the interpreter prints a back quote. Explain.

;;;;

; Simple: we know that ' is syntactic sugar to 'quote', and the second ' is the
; head of the list. Therefore, it's no surprise that the interpreter returns quote.

