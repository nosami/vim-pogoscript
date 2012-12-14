if exists("b:current_syntax")
    finish
endif

syntax match pogoAsync /[a-zA-Z$_ ]\+!\@=/
syntax match pogoTab /\t/
syntax match pogoNumber /[0-9]\+\(\.[0-9]\+\)\?/

syntax match pogoOperator /==\|!=\|<=\|>=\|<\|>/
syntax match pogoOperator /[+-/*]/
syntax match pogoOperator /=\|:=\|!/
syntax match pogoOperator /\.\|:\|,\|\.\.\./
syntax match pogoOperator /@[a-zA-Z_$][a-zA-Z_$0-9]*/

syntax match pogoBracket /@(\|@{\|#(\|[\[\](){}]/
syntax match pogoComment /\/\/.*$/
syntax match pogoKeyword /\([a-zA-Z$_]\s\+\)\@<!\<\(return\|self\|throw\|try\|catch\|finally\|if\|else\s\+if\|else\|while\|for\|new\|true\|false\|debugger\)\>\(\s\+[a-zA-Z$_]\)\@!/

syntax region pogoInterpolation start="#(" end=")" contained keepend extend contains=TOP
syntax region pogoParens start="(" end=")" transparent keepend extend

syntax region pogoComment start="/\*" end="\*/"
syntax region pogoString start="\"" end="\"" contains=pogoInterpolation
syntax region pogoString start="'" end="'"
syntax region pogoString start="r/" end="/[gim]*"

highlight link pogoTab ErrorMsg
highlight link pogoNumber Number
highlight link pogoOperator Operator
highlight link pogoBracket Delimiter
highlight link pogoAsync Macro
highlight link pogoString String
highlight link pogoKeyword Function
highlight link pogoComment Comment

let b:current_syntax = "pogo"
