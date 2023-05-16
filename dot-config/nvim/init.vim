set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath = &runtimepath
  source ~/.vimrc

if !has('nvim')
    set ttymouse=xterm2
endif
let g:python3_host_prog = '/home/andyhoang/.pyenv/versions/3.10.11/bin/python3 -m pip install pynvim'

