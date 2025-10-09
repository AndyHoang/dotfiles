vim.cmd([[

set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath = &runtimepath
  source ~/.vimrc

if !has('nvim')
    set ttymouse=xterm2
endif
let g:python3_host_prog = '/usr/bin/python3 -m pip install pynvim'

]])
