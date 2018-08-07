; Exercise 2.84:  
; Using the raise operation of exercise 2.83, modify the apply-generic procedure so that it coerces its 
; arguments to have the same type by the method of successive raising, as discussed in this section. 
; You will need to devise a way to test which of two types is higher in the tower. Do this in a manner 
; that is "compatible" with the rest of the system and will not lead to problems in adding new levels 
; to the tower.
; ---
; I won't write the code for this as I haven't solved exercise 2.82. However, one idea would be to
; use a new table that only stores types and their position in the tower. We can use this table
; in apply-generic so it can decide which type is after or before the other and so on.
