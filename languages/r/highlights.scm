; highlights.scm

; Literals

(integer) @number
(float) @number
(complex) @number

(string) @string
(string (string_content (escape_sequence) @string.escape))

; Comments

(comment) @comment

; Operators

[
  "?" ":=" "=" "<-" "<<-" "->" "->>"
  "~" "|>" "||" "|" "&&" "&"
  "<" "<=" ">" ">=" "==" "!="
  "+" "-" "*" "/" "::" ":::"
  "**" "^" "$" "@" ":" "!"
  "special"
] @operator

; Punctuation

[
  "("  ")"
  "{"  "}"
  "["  "]"
  "[[" "]]"
] @punctuation.bracket

(comma) @punctuation.delimiter

; Variables

(identifier) @variable

; Functions

(binary_operator
    lhs: (identifier) @function
    operator: "<-"
    rhs: (function_definition)
)

(binary_operator
    lhs: (identifier) @function
    operator: "="
    rhs: (function_definition)
)

; Calls

(call function: (identifier) @function)

; Parameters

(parameters (parameter name: (identifier) @function.parameters))
(arguments (argument name: (identifier) @function.arguments))

; Namespace

(namespace_operator lhs: (identifier) @type.namespace)

(call
    function: (namespace_operator rhs: (identifier) @function)
)

; Keywords

(function_definition name: "function" @keyword.function)
(function_definition name: "\\" @keyword.function)

[
    "in"
    (return)
    (next)
    (break)
] @keyword

[
    "if"
    "else"
] @keyword.conditional

[
  "while"
  "repeat"
  "for"
] @keyword.repeat

[
  (true)
  (false)
] @boolean

[
  (null)
  (inf)
  (nan)
  (na)
  (dots)
  (dot_dot_i)
] @constant.builtin

; Error

(ERROR) @error

; Roxygen tags
((comment) @comment.doc
    (#match? @comment.doc "^#'"))

; Jupyter cell tags
((comment) @comment.doc
    (#match? @comment.doc "^#\\s%%"))

; Special functions
(call function: (identifier) @property
    (#any-of? @property "stop" "library" "source"))
