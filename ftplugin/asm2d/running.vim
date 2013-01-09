if !exists("g:asm2d_make_params")
    let g:asm2d_make_params = ''
endif

if !exists('g:asm2d_map_keys')
    let g:asm2d_map_keys = 1
endif

if !exists('g:asm2d_map_prefix')
    let g:asm2d_map_prefix = '<localleader>'
endif

if !exists('g:asm2d_comment_next_line')
    let g:asm2d_comment_next_line = 1
endif

if !exists('g:asm2d_show_warnings')
    let g:asm2d_show_warnings = 1
endif

if g:asm2d_map_keys
    execute "nnoremap" "<buffer>" g:asm2d_map_prefix."m" ":call asm2d#running#Asm2dCompileAndShowMifFile()<cr>"
endif

if g:asm2d_comment_next_line
    " Strings that can start a comment line on the next line
    setlocal comments+=:;;;,:;;,:;
    setlocal formatoptions+=ro
endif

compiler asm2d
