source ~/.vim/bundles.vim

filetype plugin indent on
syntax on
colorscheme frood
runtime ftplugin/man.vim

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
set cscopetag
set autochdir
set pastetoggle=<C-\\>
set foldlevelstart=99
set errorformat+=asciidoc:\ %t%*[^:]:\ %f:\ line\ %l:\ %m

let maplocalleader=','
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]
let g:slime_no_mappings = 1
let alternateExtensions_h = "c,cpp,cxx,cc,CC,tcc"
let alternateExtensions_tcc = "h"
let alternateNoDefaultAlternate = 1
let g:slime_target = "tmux"

autocmd FileType c,cpp,perl,java setlocal cinoptions=:0,g0,(1
autocmd FileType ruby setlocal cinoptions=:0,+4s,g0,(0
autocmd FileType c,cpp,perl,java,ruby setlocal cinkeys-=0#
autocmd FileType c,cpp,perl,java,ruby setlocal formatoptions=cq
autocmd FileType c,cpp,perl,java setlocal textwidth=96 shiftwidth=4 tabstop=4
autocmd FileType ruby setlocal textwidth=96 shiftwidth=4 tabstop=4
autocmd FileType asciidoc setlocal makeprg=asciidoc\ %
autocmd FileType html,javascript setlocal tabstop=4 shiftwidth=4
autocmd FileType cpp setlocal commentstring=//\ %s
autocmd BufNewFile,BufRead *.ol setlocal textwidth=96 shiftwidth=2 tabstop=2 autoindent
autocmd BufNewFile,BufRead *.ol setlocal foldmethod=indent

map <silent> <LocalLeader>, :call Comment () <cr>
map <silent> <LocalLeader>< :call UnComment () <cr>
nmap <silent> <C-_> :noh<cr>
nmap <silent> <LocalLeader>x :SyntasticCheck <cr>
map <silent> <LocalLeader>l :set list! <cr>
map <silent> <LocalLeader>n :set nu! <cr>
xmap <silent> <LocalLeader>s <Plug>SlimeRegionSend
nmap <silent> <LocalLeader>s <Plug>SlimeLineSend
