if exists("b:current_syntax")
    finish
endif

syntax case ignore
syntax keyword asm2dKeyword ABA ABX ADDD ASRD
syntax keyword asm2dKeyword BCS BEQ BHI BKE BLO BNE BRA
syntax keyword asm2dKeyword CLRS CPK CPX
syntax keyword asm2dKeyword DRCL DRHLN DRRCT DRSYM DRVLN
syntax keyword asm2dKeyword EQU
syntax keyword asm2dKeyword INX
syntax keyword asm2dKeyword JSR
syntax keyword asm2dKeyword KEY_0 KEY_1 KEY_2 KEY_3 KEY_4 KEY_5 KEY_6 KEY_7 KEY_8
syntax keyword asm2dKeyword KEY_9 KEY_10 KEY_11 KEY_12 KEY_13 KEY_14 KEY_15
syntax keyword asm2dKeyword LDAA LDAB LDB LDD LDG LDR LDX LDXA LDXB LDYA LDYB
syntax keyword asm2dKeyword MUL
syntax keyword asm2dKeyword NEGA
syntax keyword asm2dKeyword PSHA PSHB PSHCB PSHCG PSHCR PSHX PSHXA PSHXB PSHYA PSHYB
syntax keyword asm2dKeyword PULA PULB PULCB PULCG PULCR PULX PULXA PULXB PULYA PULYB
syntax keyword asm2dKeyword RMB RSTK RTS
syntax keyword asm2dKeyword STAA STAB STD STX SUBA SUBD
syntax keyword asm2dKeyword TDXA TDXB TDYA TDYB
syntax keyword asm2dKeyword X XGDX
syntax match asm2dKeyword "\v\.MAIN"
syntax case match

syntax match asm2dComment "\v;.*$" contains=asm2dTodo

syntax match asm2dOperator "\v\+"
syntax match asm2dOperator "\v-"
syntax match asm2dOperator "\v\*"
syntax match asm2dOperator "\v/"

syntax match asm2dNumber "\v0|(-?[1-9]\d*)"
syntax match asm2dHexNumber "\v\$[0-9A-Fa-f]+"

syntax match asm2dIdentifier "\v[a-zA-Z][a-zA-Z0-9_]*"
syntax match asm2dConstant "\v\#[a-zA-Z][a-zA-Z0-9_]*"
syntax match asm2dCharacter "\v'[A-Z0-9.,;:&?!|#@<^]'"

syntax match asm2dTodo contained "\v(TODO|FIXME|XXX):"

highlight link asm2dCharacter Character
highlight link asm2dComment Comment
highlight link asm2dConstant Constant
highlight link asm2dHexNumber Number
highlight link asm2dIdentifier Identifier
highlight link asm2dKeyword Keyword
highlight link asm2dNumber Number
highlight link asm2dOperator Operator
highlight link asm2dTodo Todo

let b:current_syntax = "asm2d"
