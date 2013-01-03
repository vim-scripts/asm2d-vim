if exists("b:current_syntax")
    finish
endif

syntax case ignore
syntax keyword mifKeyword DEPTH WIDTH
syntax keyword mifKeyword ADDRESS_RADIX DATA_RADIX
syntax keyword mifKeyword BIN HEX OCT DEC UNS
syntax keyword mifKeyword CONTENT BEGIN END
syntax case match

syntax match mifComment "\v--.*$"
syntax match mifNumber "\v\d+"
syntax match mifHexNumber "\v[0-9A-Fa-f]+"
syntax match mifOperator "\v:"
syntax match mifOperator "\v\.\."

syntax region mifCommentMult start=/\v\%/ end=/\v\%/

highlight link mifComment Comment
highlight link mifCommentMult Comment
highlight link mifHexNumber Number
highlight link mifKeyword Keyword
highlight link mifNumber Number
highlight link mifOperator Operator

let b:current_syntax = "mif"
