source ~/.vim/bundles.vim

filetype plugin indent on
syntax on
colorscheme frood

set visualbell
set backspace=indent,eol,start
set laststatus=2
set showcmd
set ruler
set wildmenu
set hidden
set modeline
set t_Co=256
set t_vb=
set guifont=Inconsolata
set foldtext=
set hlsearch
set diffopt+=foldcolumn:0
set cscopetag  " so ^] will list options instead of jumping to first one
set autochdir
set pastetoggle=<C-\\>

let alternateExtensions_h = "c,cpp,cxx,cc,CC,tcc"
let alternateExtensions_tcc = "h"
let alternateNoDefaultAlternate = 1
let g:slime_target = "tmux"

autocmd FileType c,cpp,perl,java setlocal cinoptions=:0,+2s,g0,(0
autocmd FileType ruby setlocal cinoptions=:0,+4s,g0,(0
autocmd FileType c,cpp,perl,java,ruby setlocal cinkeys-=0#
autocmd FileType c,cpp,perl,java,ruby setlocal formatoptions=cq
autocmd FileType c,cpp,perl,java setlocal tw=96 cindent shiftwidth=2 softtabstop=2
autocmd FileType ruby setlocal tw=96 cindent shiftwidth=4 softtabstop=4
autocmd FileType c,cpp,perl,java,ruby setlocal expandtab
autocmd FileType go let &l:tags = &tags . "," . $GOPATH . "/tags"
autocmd FileType go setlocal makeprg=go tabstop=4 shiftwidth=4
autocmd FileType go,cpp setlocal commentstring=//\ %s
autocmd FileType asciidoc setlocal makeprg=asciidoc\ %
autocmd FileType html,javascript setlocal tabstop=4 shiftwidth=4

com! -nargs=* Go :make <args>

map <silent> <C-_> :noh<cr>

set errorformat+=%f:%l[%*\\S]:\ %m
set errorformat+=gotest:\ parse\ error:\ %f:%l:%c:\ %m
set errorformat+=asciidoc:\ %t%*[^:]:\ %f:\ line\ %l:\ %m

map <silent> ,, :call Comment () <cr>
map <silent> ,< :call UnComment () <cr>
