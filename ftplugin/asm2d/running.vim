if !exists("g:asm2d_command")
    let g:asm2d_command = 'asm2d'
endif

if !exists("g:asm2d_make_params")
    let g:asm2d_make_params = ''
endif

if !exists('g:asm2d_map_keys')
    let g:asm2d_map_keys = 1
endif

if !exists('g:asm2d_map_prefix')
    let g:asm2d_map_prefix = '<localleader>'
endif

silent execute "setlocal" "makeprg=" . g:asm2d_command . "\\ %"

if g:asm2d_map_keys
    execute "nnoremap" "<buffer>" g:asm2d_map_prefix."m" ":call asm2d#running#Asm2dCompileAndShowMifFile()<cr>"
endif
