let g:quickfix_is_open = 0

let b:error_list = {}
let b:next_sign_id = 1

function! s:ShowErrors()
    for error in getqflist()
        let item = {}
        let item["lnum"] = error.lnum
        let item["text"] = error.text
        let b:error_list[error.lnum] = item
        let type = error.type ==? "W" ? "asm2dWarning" : "asm2dError"
        execute "sign place" b:next_sign_id "line=" . item.lnum "name=" . type "file=" . expand("%:p")
        let b:next_sign_id += 1
    endfor

    let g:quickfix_return_to_window = winnr()
    copen
    let g:quickfix_is_open = 1
endfunction

function! s:ClearErrors()
    sign unplace *
    let b:error_list = {}
    let b:next_sign_id = 1
endfunction

function! asm2d#running#Asm2dCompileAndShowMifFile()
    execute "write"
    let filename = expand('%:r') . ".mif"
    let buff_num = bufwinnr(filename)

    call s:ClearErrors()
    silent execute "make" g:asm2d_make_params

    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    endif

    if v:shell_error
        call s:ShowErrors()
    else
        if g:asm2d_show_warnings && len(getqflist()) > 0
            call s:ShowErrors()
            wincmd p
        endif

        " Don't open a new window if the file is already open
        if buff_num >= 0
            silent execute buff_num . "wincmd w"
            edit
        else
            silent execute "vsplit" filename
        endif
    endif
endfunction
