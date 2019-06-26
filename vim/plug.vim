" ----------------------------------------------------------------------------
"   Plug
" ----------------------------------------------------------------------------

" Install vim-plug if we don't already have it
"if empty(glob("~/.vim/autoload/plug.vim"))
""Ensure all needed directories exist  (Thanks @kapadiamush)
    "execute 'mkdir -p ~/.vim/plugged'
    "execute 'mkdir -p ~/.vim/autoload'
    "" Download the actual plugin manager
    "execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
"endif

call plug#begin('~/.vim/plugged')
" Plug 'metakirby5/codi.vim' " nice to have when learning new lang
Plug 'maximbaz/lightline-ale' | Plug 'itchyny/lightline.vim' | Plug 'w0rp/ale'
Plug 'tpope/vim-obsession'
"Plug 'Chiel92/vim-autoformat'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'luochen1990/rainbow'
Plug 'racer-rust/vim-racer'
Plug 'scrooloose/nerdcommenter'
Plug 'mbbill/undotree'
Plug 'parkr/vim-jekyll'
"Indent Guides is a plugin for visually displaying indent levels in Vim.
Plug 'nathanaelkane/vim-indent-guides'
"use sign column to indicate added, modified and removed lines
Plug 'mhinz/vim-signify'
Plug 'heavenshell/vim-pydocstring'
"use enter to select things
Plug 'gcmt/wildfire.vim'

" Syntax
"Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-git', { 'for': 'git' }
"Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
"Plug 'JamshedVesuna/vim-markdown-preview' , { 'for': 'markdown' }
Plug 'jremmen/vim-ripgrep'

" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

Plug 'majutsushi/tagbar' ", { 'on': 'TagbarToggle' }

" Fugitive: Git from within Vim
Plug 'tpope/vim-fugitive' "| Plug 'shumphrey/fugitive-gitlab.vim'

" Themes
Plug 'junegunn/seoul256.vim'
Plug 'jdkanani/vim-material-theme'
Plug 'kristijanhusak/vim-hybrid-material'

Plug 'rhysd/conflict-marker.vim'
Plug 'jiangmiao/auto-pairs'
"install by brew fzf

"Plug '/home/linuxbrew/.linuxbrew/bin/fzf'
Plug 'junegunn/fzf.vim'
"Plug 'rking/ag.vim'
"Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'


filetype plugin indent on                   " required!
call plug#end()
