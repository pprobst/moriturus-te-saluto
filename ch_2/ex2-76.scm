; Exercise 2.76:
; As a large system with generic operations evolves, new types of data objects or new operations may be needed.
; For each of the three strategies -- generic ops with explicit dispatch, data-directed style, and message-passing-style --
; describe the changes that must be made to a system in order to add new types or new operations. Which organization would
; be most appropriate for a system in which new types must often be added? and new operations?

; > Generic ops with explicit dispatch:
; - o novo tipo de dado deve estar apropriadamente taggeado;
; - as operações genéricas devem ser atualizadas para suportar o novo tipo de dado (não aditiva);
; - se uma operação nova for criada, ela deve ter um comportamente específico para cada tipo de dado (aditiva).

; > Data-directed style:
; - para adicionar um novo tipo de dado, não precisamos alterar os procedimentos existentes, apenas colocar as novas entradas 
;   na tabela (não aditiva);
; - quando precisamos de novas operações, precisamos alterar os pacotes existentes (não aditiva)

; > Message-passing-style:
; - com novos tipos de dados, precisamos escrever novos construtores para eles que retorne um procedimento dispatch (aditiva);
; - com novas operações, precisamos alterar cada construtor existente (não aditiva).

; Num sistema onde novos tipos de daos são frequentemente adicionados, message-passing-style é preferível. Os outros dois outros
; métodos requerem mais mudanças.

; Num sistema onde novas operações são frequentemente adicionadas, talvez data-directed ou message-passing sejam mais apropriados. 
; As mudanças realizadas usando explicit dispatch são muito trabalhosas... no explicit dispatch precisamos especificar o comportamento 
; da nova operação para cada tipo de dado.

; oops, ended up writing this in portuguese without noticing it; it's not like anyone is reading this, anyways... 
