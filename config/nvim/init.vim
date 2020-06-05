
" for minpac
packadd minpac
call minpac#init()
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" for start plugins
call minpac#add('tpope/vim-unimpaired')
" NOTE: shiftwidth is 6 in vim-orgmode
call minpac#add('jceb/vim-orgmode')
" for defining <localleader> in vim-orgmode
let maplocalleader = ','

" for opt plugins
call minpac#add('tpope/vim-scriptease', {'type': 'opt'})
" You can make minpac manage itself by adding this line to your vimrc:
call minpac#add('k-takata/minpac', {'type': 'opt'})

" misc
let g:python3_host_prog = '/usr/local/bin/python3'
set shiftwidth=4

