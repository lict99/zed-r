; Variables by assignment operators
(binary_operator
    lhs: (identifier) @name
    operator: ["<-" "=" "<<-"]
    rhs: (_ name: ["function" "\\"]? @context)
) @item

(binary_operator
    lhs: (_ name: ["function" "\\"]? @context)
    operator: ["->" "->>"]
    rhs: (identifier) @name
) @item

; Variables by `for` loop
(for_statement
    variable: (identifier) @name
) @item

; Jupyter cell tags
(
    (comment) @name
    (#match? @name "^#\\s%%")
) @item
