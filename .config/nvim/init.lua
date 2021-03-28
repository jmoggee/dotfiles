-------------------- HELPERS -------------------------------
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-------------------- PLUGINS -------------------------------
cmd 'packadd paq-nvim'               -- load the package manager
local paq = require('paq-nvim').paq  -- a convenient alias
paq {'savq/paq-nvim', opt = true}    -- paq-nvim manages itself

paq {'b4skyx/serenade'}

paq {'norcalli/nvim-colorizer.lua'}

paq {'itchyny/lightline.vim'}

paq {'tpope/vim-vinegar'}
paq {'tpope/vim-endwise'}
paq {'tpope/vim-fugitive'}

paq {'nvim-treesitter/nvim-treesitter'}
paq {'neovim/nvim-lspconfig'}
paq {'hrsh7th/nvim-compe'}
paq {'onsails/lspkind-nvim'}

paq {'vim-python/python-syntax'}
paq {'psf/black'}

paq {'elixir-editors/vim-elixir'}
paq {'mhinz/vim-mix-format'}

paq {'nvim-lua/popup.nvim'}
paq {'nvim-lua/plenary.nvim'}
paq {'nvim-telescope/telescope.nvim'}

paq {'gcmt/taboo.vim'}

paq {'lukas-reineke/indent-blankline.nvim', branch='lua'}

paq {'vimwiki/vimwiki'}

-------------------- OPTIONS -------------------------------
cmd('colorscheme serenade')

opt('b', 'expandtab', true)
opt('b', 'shiftwidth', 2)
opt('b', 'tabstop', 2)
opt('b', 'smartindent', true)
opt('o', 'termguicolors', true)
opt('o', 'ignorecase', true)
opt('o', 'completeopt', 'menu,menuone,noselect')
opt('o', 'mouse', 'a')
opt('o', 'swapfile', false)
opt('w', 'number', true)
opt('w', 'relativenumber', true)


-------------------- MAPPINGS ------------------------------
g.mapleader = " "

map('i', 'jk', '<esc>')

-- Fuzzy find
map('n', '<leader>ff', '<cmd>Telescope git_files<cr>', {noremap = true})
map('n', '<leader>fa', '<cmd>Telescope find_files<cr>', {noremap = true})
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {noremap = true})
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {noremap = true})
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {noremap = true})

-- Tabs
map('n', '<tab>', '<cmd>tabnext<cr>', {noremap = true})
map('n', '<s-tab>', '<cmd>tabprevious<cr>', {noremap = true})
map('n', '<c-t>w', '<cmd>tabnew<cr>', {noremap = true})
map('n', '<c-t>q', '<cmd>tabclose<cr>', {noremap = true})
map('n', '<c-t>o', ':TabooOpen ', {noremap = true})
map('n', '<c-t>r', ':TabooRename ', {noremap = true})

-- Git
map('n', '<leader>gb', '<cmd>Git blame<cr>')
map('n', '<leader>gs', '<cmd>Git status<cr>')
map('n', '<leader>gc', '<cmd>Git commit -v<cr>')
map('n', '<leader>ga', '<cmd>Git add -p<cr>')
map('n', '<leader>gm', '<cmd>Git commit --amend<cr>')
map('n', '<leader>gp', '<cmd>Git push<cr>')
map('n', '<leader>gf', '<cmd>Git pull<cr>')
map('n', '<leader>gd', '<cmd>Git diff<cr>')
map('n', '<leader>gw', '<cmd>Git write<cr>')

-------------------- LSP SETUP------------------------------
vim.lsp.set_log_level("debug")
local nvim_lsp = require('lspconfig')
local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end

nvim_lsp.elixirls.setup{
  cmd = {'/home/jean/.elixir-ls/language_server.sh'},
  on_attach = on_attach,
}

nvim_lsp.pyright.setup{
  on_attach = on_attach,
}

require('compe').setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
  };
}

require('lspkind').init()

-- TREESITTER
require('nvim-treesitter.configs').setup {
  ensure_installed = {'javascript', 'rust', 'vue', 'python'},
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  indentation = {
    enable = true,
  },
  folding = {
    enable = true,
  },
}

-- TERMINAL
-- No line numbers in :terminal or quickfix
cmd("autocmd TermOpen * setlocal nonumber norelativenumber")
cmd("autocmd FileType qf setlocal nonumber norelativenumber")

-- FUZZY FIND
require('telescope').setup {}

-- INDENT LINE
g.indent_blankline_char = '▏'

-- LIGHTLINE
vim.g.lightline = {
  colorscheme = 'serenade';
  active = {
    left = {
      {'mode', 'paste'},
      {'gitbranch', 'readonly', 'filename', 'modified'}
    }
  };
  component_function = { gitbranch = 'fugitive#head', };
}

-- COLORIZER
require('colorizer').setup()

-- VIMWIKI
-- g.vimwiki_list = {{path = '~/vimwiki/', syntax = 'markdown', ext = '.md'}}

-- PYTHON
g.python_highlight_all = 1
cmd("autocmd BufWritePre *.py execute ':Black'")

-- ELIXIR
g.mix_format_on_save = 1
