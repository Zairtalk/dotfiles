"#=================================================#

"# Nvim settings

"#=================================================#

set ignorecase
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set smartcase
set smartindent
set mouse=v
set hlsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set number relativenumber
set clipboard=unnamedplus
set cursorline
set ttyfast
set completeopt=noinsert,menuone,noselect
set termguicolors
set undofile
set undodir=~/.config/nvim/undo
set undolevels=1000

"#=================================================#

"# Vim-plug

"#=================================================#

call plug#begin()

Plug 'folke/tokyonight.nvim', {'branch':'main'} "# theme
Plug 'nvim-lualine/lualine.nvim' "# bottom line 
Plug 'neovim/nvim-lspconfig' "# autocomplete
Plug 'kyazdani42/nvim-web-devicons' "# icons for bottom line 
" Plug 'neoclide/coc.nvim', {'branch': 'release'} "# todo
" Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'} "# Space + v file tree
Plug 'tpope/vim-repeat' "# repeat for plugins
" Plug 'tpope/vim-surround' "# change surround chars (ys, cs, ds) keys
Plug 'machakann/vim-sandwich' "# upper plugin analog (sa, sd, sr) keys
" Plug 'ncm2/ncm2' "# 
" Plug 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' } "# 
Plug 'jeffkreeftmeijer/vim-numbertoggle' "# toggle line numbers in normal mode
" Plug 'ncm2/ncm2-jedi' "# 
Plug 'tpope/vim-commentary' "# add comments with gc
Plug 'vim-scripts/ReplaceWithRegister' "# replace with gr
" Plug 'ap/vim-css-color' "# add colors to hex codes
Plug 'chrisbra/Colorizer' "# colors alternative
Plug 'folke/which-key.nvim' "# key-hints
Plug 'tpope/vim-fugitive' "# git plugin :help fugutive
Plug 'lewis6991/gitsigns.nvim' "# git highlights
Plug 'Raimondi/delimitMate' "# auto close  , ' , ( , [ , etc.
" Plug 'kevinhwang91/nvim-hlslens' "# better search highlights
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
" Plug 'SirVer/ultisnips' "# snippets engine
" Plug 'honza/vim-snippets' "# snippets
Plug 'goolord/alpha-nvim' "# greeter
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' } "# buffer tabs at the top
Plug 'lukas-reineke/indent-blankline.nvim' "# indent lines
" Plug 'Pocco81/AutoSave.nvim' "# autosave
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "# programming highlights
Plug 'michaeljsmith/vim-indent-object' "# indent object
Plug 'simeji/winresizer' "# easy window resizing
Plug 'simnalamburt/vim-mundo' "# undo tree
Plug 'easymotion/vim-easymotion' "# easy motion
" Plug 'dense-analysis/ale' "# code linting
Plug 'williamboman/mason.nvim' "# LSP installer
Plug 'mfussenegger/nvim-dap' "# Debugger
Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim' "# Fancy lines
Plug 'williamboman/mason-lspconfig.nvim' "# Mason addition
Plug 'rust-lang/rust.vim' "# Rust configurations
Plug 'ervandew/supertab' "# Supertab 
Plug 'nvim-lua/plenary.nvim'
Plug 'simrat39/rust-tools.nvim' "# Lsp rust extender
Plug 'mfussenegger/nvim-lint' "# Linting

Plug 'gelguy/wilder.nvim', { 'do': 'UpdateRemotePlugins' } "# commands autocomplete

Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'kdheepak/lazygit.nvim'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'rcarriga/nvim-dap-ui'
  

call plug#end()

call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'enable_cmdline_enter': 0,
      \ })

call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'left': [
      \   ' ', wilder#popupmenu_devicons(),
      \ ],
      \ 'right': [
      \   ' ', wilder#popupmenu_scrollbar(),
      \ ],
      \ }))
"#=================================================#

"# Initialize lua plugins

"#=================================================#

source ~/.config/nvim/which-key.vim

lua << EOF

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

local lspconfig = require('lspconfig')

vim.g.coq_settings = { 
    auto_start = 'shut-up',
}

local servers = {'pyright','rust_analyzer'}

local dap = require('dap')

dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb', -- adjust as needed, must be absolute path
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

local keymap = vim.keymap.set
local saga = require('lspsaga')

saga.init_lsp_saga()

keymap("n", "[E", function()
require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
keymap("n", "]E", function()
require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })


for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup(require('coq').lsp_ensure_capabilities({
  }))
end

lspconfig.pyright.setup{}

require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua", "rust_analyzer" },
    automatic_installation = true,
    })

require('gitsigns').setup()

require('mason').setup()

require('mason-lspconfig').setup()

local opts = {
  tools = {
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },
  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    on_attach = on_attach,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
}

require('rust-tools').setup(opts)

require('lsp_lines').setup()


--require('hlslens').setup({
--    calm_down = true,
--    nearest_only = true,
--    nearest_float_when = 'always'
--})

require('lualine').setup ()
require('lualine').setup {
    options = { theme  =  'nightfly' },
}
require("bufferline").setup{
    options = {
        numbers = "buffer_id",
        diagnostics = "nvim_lsp"
        },
}

require("indent_blankline").setup {

   show_current_context = true,
    show_current_context_start = true,
    space_char_blankline = " ",
}

require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "lua", "rust", "python" },
  sync_install = false,
  ignore_install = { "javascript" },
  highlight = {enable = true},
}

require("dapui").setup()

vim.opt.list = true
vim.opt.listchars:append("space:•")
vim.opt.listchars:append("eol:↴")

vim.diagnostic.config({
    virtual_text = false,
})

require('rust-tools').setup{
    inlay_hints = {
        auto = true,
        }
}

-- vim.g.autosave_state = true

EOF

"#=================================================#

"# Custom configurations

"#=================================================#

colorscheme tokyonight

" autocmd BufEnter * call ncm2"#enable_for_buffer()

augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END


let g:mapleader = "\<Space>"
let g:maplocalleader = ','
let g:winresizer_start_key = "<leader>w"

lua << EOF

    vim.keymap.set("","<Leader>l",require("lsp_lines").toggle,{desc = "Toggle lsp_lines" })

EOF

" nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
" nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

nnoremap <Left> <C-w>h
nnoremap <Down> <C-w>j
nnoremap <Up> <C-w>k
nnoremap <Right> <C-w>l
" nnoremap <leader>v <cmd>CHADopen<cr>
nnoremap <silent> <Tab> :BufferLineCycleNext<CR>
nnoremap <silent> <S-Tab> :BufferLineCyclePrev<CR>
nnoremap <leader>m :DelimitMateSwitch<cr>
" nnoremap <leader>f :FZF<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>u :MundoToggle<cr>
nnoremap <silent> <leader>g :LazyGit<CR>
map <esc> :noh<cr>

nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>db <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>dB <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <Leader>dm <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
nnoremap <silent> <Leader>dt <Cmd>lua require'dapui'.toggle()<CR>

nnoremap <silent> <Leader>dt <Cmd>lua require'dapui'.toggle()<CR>

nnoremap <silent> <leader>ca <cmd>Lspsaga code_action<CR>
xnoremap <silent> <leader>ca <cmd>Lspsaga code_action<CR>
nnoremap <silent> <leader>cr <cmd>Lspsaga rename<CR>
nnoremap <silent> gd <cmd>Lspsaga lsp_finder<CR>
nnoremap <silent> <leader>cd <cmd>Lspsaga show_line_diagnostics<CR>
nnoremap <silent> <leader>cd <cmd>Lspsaga show_cursor_diagnostics<CR>
nnoremap <silent> [e <cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> ]e <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> <leader>o <cmd>LSoutlineToggle<CR>
nnoremap <silent> K <cmd>Lspsaga hover_doc<CR>

tnoremap <Esc> <C-\><C-n>

" let g:coq_settings = { 'auto_start': 'shut-up' }
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

runtime macros/sandwich/keymap/surround.vim

" # Neovide config
if exists("g:neovide")
    let g:neovide_refresh_rate_idle=5
    let g:neovide_cursor_animation_length=0.05
    let g:neovide_cursor_antialiasing=v:true
    let g:neovide_cursor_trail_length=0.1
    let g:neovide_cursor_vfx_mode = "railgun"
    " set guifont=Fire\Code
 endif
