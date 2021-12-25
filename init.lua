local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('mileszs/ack.vim')
Plug('~/.fzf')
Plug('NLKNguyen/papercolor-theme')

-- lsp related
Plug('neovim/nvim-lspconfig')
Plug('jose-elias-alvarez/null-ls.nvim')
Plug('jose-elias-alvarez/nvim-lsp-ts-utils')

vim.call('plug#end')
-- call :PlugInstall


-- global variables
vim.g.notimeout=true   -- do not wait after leader key
vim.g.wrap={'linebreak', 'nolist'}
vim.g.mapleader = ","
vim.g.foldenable=false
vim.g.tags=tags
-- Directories for swp files
vim.g.nobackup=true
vim.g.noswapfilp=true
vim.g.backupdir="~/.vimbackup"
vim.g.directory="~/.vimbackup"


--
local set = vim.opt
set.encoding="utf-8"
set.number=true
set.ruler=true
set.rtp:append("~/.fzf")

-- Whitespace stuff
set.tabstop=2
set.shiftwidth=2
set.softtabstop=2
set.expandtab=true
-- Show trailing spaces and highlight hard tabs
set.list=true
set.listchars={tab="»·", trail="·"}
-- allow backspacing over everything in insert mode
set.backspace={"indent","eol","start"}
-- allow mouse click
set.mouse='a'

--------- finding/searching
set.wildmenu=true
set.path:append("**")

vim.cmd([[
  if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif
]])

vim.cmd([[
  let g:fzf_layout = { 'down': '~30%' }
  let g:fzf_action = {
    \ 'ctrl-h': 'split',
    \ 'ctrl-v': 'vsplit' }
  nmap <C-p> :FZF<cr>
]])



------- highlighting
vim.cmd([[
  syntax enable
  set background=dark
  colorscheme PaperColor
]])

-- show matching brackets for a moment
set.showmatch=true
-- highlight search results
set.hlsearch=true
-- icremental search
set.incsearch=true

------ Style
vim.cmd([[
  let g:prettier#quickfix_enabled = 0
  let g:prettier#autoformat = 0
  let g:prettier#config#trailing_comma = 'es5'
  let g:prettier#config#tab_width = 4
  let g:prettier#config#print_width = 120
  let g:prettier#config#jsx_bracket_same_line = 'true'
  let g:prettier#config#single_quote = 'true'
  let g:prettier#config#bracket_spacing = 'true'
  autocmd BufWritePre *.ts,*.tsx Prettier
]])


------ lsp
require('lsp_config')

--------- key mappings
-- use ;; instead of esc to reenter normal mode
vim.api.nvim_set_keymap('i', ';;', '<Esc>', {noremap = true})
vim.api.nvim_set_keymap('v', ';;', '<Esc>gV', {noremap = true})
-- reload immediatly after pressing F5
vim.api.nvim_set_keymap('n', '<F5>', ':checktime<CR>', {noremap = true})
-- somehow Y is not working in nvim
vim.api.nvim_set_keymap('n', 'Y', 'yy', {noremap = true})
-- clear search
vim.api.nvim_set_keymap('n', 'C-l', ':<C-u>nohlsearch<CR><C-l>', {noremap=true, silent=true})

