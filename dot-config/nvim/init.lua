vim.cmd([[

set runtimepath^=~/.vim runtimepath+=~/.vim/after
  let &packpath = &runtimepath
  source ~/.vimrc

if !has('nvim')
    set ttymouse=xterm2
endif

]])

-- ty as a Python navigation server: gd/K only, no type checking.
-- Requires the server binary:  uv tool install ty
-- diagnosticMode='off' stops ty reporting errors ('openFilesOnly' re-enables).
vim.lsp.config('ty', {
  cmd = { 'ty', 'server' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', '.git' },
  settings = { ty = { diagnosticMode = 'off' } },
})
vim.lsp.enable('ty')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf })
  end,
})
