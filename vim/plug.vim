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
Plug 'maximbaz/lightline-ale' | Plug 'itchyny/lightline.vim' | Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
"Plug 'easymotion/vim-easymotion'
"Plug 'tpope/vim-obsession'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'jgdavey/tslime.vim'
"
"Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'
Plug 'junegunn/vim-easy-align'
Plug 'vimwiki/vimwiki'

"Plug 'Chiel92/vim-autoformat'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'luochen1990/rainbow'
Plug 'racer-rust/vim-racer'
Plug 'scrooloose/nerdcommenter'
Plug 'mbbill/undotree'
"Plug 'parkr/vim-jekyll'
"Indent Guides is a plugin for visually displaying indent levels in Vim.
Plug 'nathanaelkane/vim-indent-guides'
"use sign column to indicate added, modified and removed lines
Plug 'mhinz/vim-signify'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
"use enter to select things
Plug 'gcmt/wildfire.vim'
Plug 'nanotee/zoxide.vim'

" Syntax
"Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-git', { 'for': 'git' }
"Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
"Plug 'JamshedVesuna/vim-markdown-preview' , { 'for': 'markdown' }
Plug 'JesseLeite/vim-agriculture'
"Plug 'jremmen/vim-ripgrep'
"Plug 'wincent/ferret'

" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" Fugitive: Git from within Vim
Plug 'tpope/vim-fugitive' "| Plug 'shumphrey/fugitive-gitlab.vim'

Plug 'rhysd/conflict-marker.vim'
"Plug 'tmsvg/pear-tree'
Plug 'machakann/vim-sandwich'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'laher/fuzzymenu.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Themes
Plug 'junegunn/seoul256.vim'
Plug 'wojciechkepka/vim-github-dark'
Plug 'jdkanani/vim-material-theme'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'savq/melange'


"Plug 'rking/ag.vim'
"Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'


filetype plugin indent on                   " required!
call plug#end()
