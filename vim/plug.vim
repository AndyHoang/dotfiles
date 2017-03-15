" ----------------------------------------------------------------------------
"   Plug
" ----------------------------------------------------------------------------

" Install vim-plug if we don't already have it
"if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
"    execute 'mkdir -p ~/.vim/plugged'
"    execute 'mkdir -p ~/.vim/autoload'
"    " Download the actual plugin manager
"    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
"endif

call plug#begin('~/.vim/plugged')

" Colorschemes
" Plug 'captbaritone/molokai'

" Plug 'chriskempson/base16-vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'itchyny/lightline.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'morhetz/gruvbox'
Plug 'davidhalter/jedi-vim'
Plug 'mhinz/vim-startify'

" Syntax
Plug 'tpope/vim-git', { 'for': 'git' }
" Plug 'qrps/lilypond-vim', { 'for': 'lilypond' }
" Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" Plug 'mxw/vim-jsx'

" Completion



" Syntastic: Code linting errors
Plug 'scrooloose/syntastic'

" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'
Plug 'majutsushi/tagbar'

" Fancy statusline
" Plug 'bling/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Fuzzy file opener
Plug 'ctrlpvim/ctrlp.vim'



" Search files using Silver Searcher
" Plug 'rking/ag.vim'

" Make Ag searches of selected text

" Rename/remove files from within vim
" Plug 'tpope/vim-eunuch'

" Make commenting easier
" Plug 'tpope/vim-commentary'

" Navigate files in a sidebar
Plug 'scrooloose/nerdtree'


" Split and join lines of code intelligently
"Plug 'AndrewRadev/splitjoin.vim'

" Only show cursorline in the current window
"Plug 'vim-scripts/CursorLineCurrentWindow'

" Split navigation that works with tmux
"Plug 'christoomey/vim-tmux-navigator'

" Change brackets and quotes
"Plug 'tpope/vim-surround'

" Make vim-surround repeatable with .
"Plug 'tpope/vim-repeat'

" Custom motions

"

" Fugitive: Git from within Vim
Plug 'tpope/vim-fugitive'




filetype plugin indent on                   " required!
call plug#end()
