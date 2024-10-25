local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    { 'nvim-lua/plenary.nvim' },
    { 'hrsh7th/nvim-cmp', },
    -- "easymotion/vim-easymotion",
    "itchyny/lightline.vim",
    "sheerun/vim-polyglot",
    "junegunn/vim-easy-align",
    "vimwiki/vimwiki",
    "mbbill/undotree",
    "luochen1990/rainbow",
    "scrooloose/nerdcommenter",
    "nathanaelkane/vim-indent-guides",
    "mhinz/vim-signify",
    {
      "kkoomen/vim-doge",
      build = ":call doge#install()"
    },
    "gcmt/wildfire.vim",
    {
      "tpope/vim-git",
      ft = "git"
    },
    "cohama/lexima.vim",
    "tpope/vim-fugitive",
    "shumphrey/fugitive-gitlab.vim",
    "rhysd/conflict-marker.vim",
    {
      "junegunn/fzf",
      build = "./install --all"
    },
    "junegunn/fzf.vim",
    "dcampos/nvim-snippy",
    "honza/vim-snippets",
    --"github/copilot.vim",
    "tpope/vim-dispatch",
    "savq/melange",
    { "neoclide/coc.nvim", branch = "release" },
    -- Commented out plugins:
    -- "maximbaz/lightline-ale",
    -- "dense-analysis/ale",
    -- { "heavenshell/vim-pydocstring", build = "make install", ft = "python" },
    -- "machakann/vim-sandwich",
    -- "SirVer/ultisnips",
    -- "junegunn/seoul256.vim",
    -- "wojciechkepka/vim-github-dark",
    -- "jdkanani/vim-material-theme",
    -- "kristijanhusak/vim-hybrid-material",
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = {},
  -- automatically check for plugin updates
  checker = { enabled = true },
})


vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

if !has('nvim')
    set ttymouse=xterm2
endif
let g:python3_host_prog = '/home/andyhoang/.pyenv/versions/3.10.11/bin/python3 -m pip install pynvim'
]])
