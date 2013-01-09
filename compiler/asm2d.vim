" Vim compiler file
" Compiler:         asm2d Compiler

if exists("current_compiler")
  finish
endif
let current_compiler = "asm2d"

let s:cpo_save = &cpo
set cpo&vim

if !exists("g:asm2d_command")
    let g:asm2d_command = 'asm2d'
endif

execute "CompilerSet" "makeprg=" . g:asm2d_command . "\\ %"
CompilerSet shellpipe=2>&1\ \|\ tee\ %s;exit\ \${PIPESTATUS[0]}
CompilerSet errorformat=
    \%tRROR:\ %m\ (at\ line:\ %l),
    \%tARNING:\ %m\ (at\ line:\ %l)

sign define asm2dError   text=>> texthl=Error
sign define asm2dWarning text=>> texthl=Todo

let &cpo = s:cpo_save
unlet s:cpo_save
