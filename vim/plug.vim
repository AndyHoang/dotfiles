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
Plug 'maximbaz/lightline-ale' | Plug 'itchyny/lightline.vim' | Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'
"Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/vim-easy-align'
Plug 'vimwiki/vimwiki'

"Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'luochen1990/rainbow'
Plug 'racer-rust/vim-racer'
Plug 'scrooloose/nerdcommenter'
"Indent Guides is a plugin for visually displaying indent levels in Vim.
Plug 'nathanaelkane/vim-indent-guides'
"use sign column to indicate added, modified and removed lines
Plug 'mhinz/vim-signify'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
"use enter to select things
Plug 'gcmt/wildfire.vim'
"Plug 'nanotee/zoxide.vim'

Plug 'tpope/vim-git', { 'for': 'git' }
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
"Plug 'JesseLeite/vim-agriculture'

" Pairs of handy bracket mappings
Plug 'cohama/lexima.vim'

" Fugitive: Git from within Vim
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'

Plug 'rhysd/conflict-marker.vim'
"Plug 'machakann/vim-sandwich'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'SirVer/ultisnips'
Plug 'dcampos/nvim-snippy'
Plug 'honza/vim-snippets'
Plug 'github/copilot.vim'
" Make/Focus/Start in vim
Plug 'tpope/vim-dispatch'

" Themes
"Plug 'junegunn/seoul256.vim'
"Plug 'wojciechkepka/vim-github-dark'
"Plug 'jdkanani/vim-material-theme'
"Plug 'kristijanhusak/vim-hybrid-material'
Plug 'savq/melange'


filetype plugin indent on                   " required!
call plug#end()
