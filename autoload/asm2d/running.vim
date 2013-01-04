let g:quickfix_is_open = 0

function! asm2d#running#Asm2dCompileAndShowMifFile()
    execute "write"
    let filename = expand('%:r') . ".mif"
    let buff_num = bufwinnr(filename)

    silent execute "make" g:asm2d_make_params

    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    endif

    if v:shell_error
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    else
        " Don't open a new window if the file is already open
        if buff_num >= 0
            silent execute buff_num . "wincmd w"
            edit
        else
            silent execute "vsplit" filename
        endif
    endif
endfunction
