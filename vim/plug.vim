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
" Plug 'metakirby5/codi.vim' " nice to have when learning new lang
" Colorschemes
" Plug 'captbaritone/molokai'

" Plug 'chriskempson/base16-vim'
"Plug 'jeetsukumaran/vim-buffergator'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'morhetz/gruvbox'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'luochen1990/rainbow'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdcommenter'
Plug 'mbbill/undotree'
Plug 'parkr/vim-jekyll'
"Plug 'Shougo/denite.nvim'
"Indent Guides is a plugin for visually displaying indent levels in Vim.
Plug 'nathanaelkane/vim-indent-guides'
"use sign column to indicate added, modified and removed lines
Plug 'mhinz/vim-signify'
Plug 'heavenshell/vim-pydocstring'
" Bundle 'kana/vim-textobj-user'
"Bundle 'kana/vim-textobj-indent'
"use enter to select things
Plug 'gcmt/wildfire.vim'
"surroud word faster
Plug 'tpope/vim-surround'

" Syntax
Plug 'tpope/vim-git', { 'for': 'git' }
" Plug 'qrps/lilypond-vim', { 'for': 'lilypond' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" Plug 'mxw/vim-jsx'

" Syntastic: Code linting errors
"Plug 'scrooloose/syntastic'

" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'
Plug 'majutsushi/tagbar' ", { 'on': 'TagbarToggle' }
"Plug 'terryma/vim-smooth-scroll'

" Fuzzy file opener
Plug 'ctrlpvim/ctrlp.vim' | Plug 'tacahiroy/ctrlp-funky'

" Fugitive: Git from within Vim
Plug 'tpope/vim-fugitive'


" Navigate files in a sidebar
"Plug 'scrooloose/nerdtree' ", { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tpope/vim-vinegar'

Plug 'rhysd/conflict-marker.vim'
Plug 'jiangmiao/auto-pairs'
"install by brew fzf
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

" Search files using Silver Searcher
" Plug 'rking/ag.vim'


" Split and join lines of code intelligently
Plug 'AndrewRadev/splitjoin.vim'

" Make vim-surround repeatable with .
"Plug 'tpope/vim-repeat'



filetype plugin indent on                   " required!
call plug#end()
