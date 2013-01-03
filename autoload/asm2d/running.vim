function! asm2d#running#Asm2dShowMifFile()
    let filename = expand('%:r') . ".mif"
    let buff_num = bufwinnr(filename)

    " Don't open a new window if the file is already open
    if buff_num >= 0
        silent execute buff_num . "wincmd w"
        edit
    else
        if filereadable(filename) == 0
            silent make
        endif
        silent execute "vsplit" filename
    endif
endfunction
