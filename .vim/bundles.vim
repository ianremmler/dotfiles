set nocompatible rtp+=~/.vim/bundle/vundle/
filetype off
call vundle#rc()

" github
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-pathogen'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'jpalardy/vim-slime'
Bundle 'ianremmler/gostuff'
Bundle 'ianremmler/frood'
Bundle 'ianremmler/comment'
Bundle 'vimwiki/vimwiki'
Bundle 'rosenfeld/conque-term'
Bundle 'dgryski/vim-godef'
" vim-scripts
Bundle 'Align'
Bundle 'a.vim'
Bundle 'camelcasemotion'
" non github
Bundle 'http://repo.or.cz/r/vcscommand.git'

call pathogen#infect('~/.vim/pathogen')
