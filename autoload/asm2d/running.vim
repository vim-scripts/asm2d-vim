function! asm2d#running#Asm2dCompileAndShowMifFile()
    let filename = expand('%:r') . ".mif"
    let buff_num = bufwinnr(filename)

    execute "make" g:asm2d_make_params

    " Don't open a new window if the file is already open
    if buff_num >= 0
        silent execute buff_num . "wincmd w"
        edit
    else
        silent execute "vsplit" filename
    endif
endfunction
