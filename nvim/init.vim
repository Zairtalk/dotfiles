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
Plug 'kevinhwang91/nvim-hlslens' "# better search highlights
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

require('rust-tools').setup({})

require('lsp_lines').setup()


require('hlslens').setup({
    calm_down = true,
    nearest_only = true,
    nearest_float_when = 'always'
})
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
nnoremap <leader>d :DelimitMateSwitch<cr>
nnoremap <leader>f :FZF<cr>
nnoremap <leader>u :MundoToggle<cr>
nnoremap <silent> <leader>gg :LazyGit<CR>
map <esc> :noh<cr>

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
    set guifont=Fire\Code
 endif
