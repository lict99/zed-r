; Variables by assignment operators
(binary_operator
    lhs: (identifier) @name
    operator: ["<-" "=" "<<-"]
    rhs: (_)
) @item

(binary_operator
    lhs: (_)
    operator: ["->" "->>"]
    rhs: (identifier) @name
) @item

; Variables by `for` loop
(for_statement
    variable: (identifier) @name
) @item

; Jupyter cell tag
(
    (comment) @name
    (#match? @name "^#\\s?%%")
) @item
