"HerringtonDarkholme/yats.vim vim-plug

"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

"Plug 'junegunn/fzf.vim'

"------------------Start of Plugins-------------------"
call plug#begin('~/.vim/plugged')
"-------------------Existing Plugins------------------"

Plug 'wakatime/vim-wakatime'
"Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Chiel92/vim-autoformat'
Plug 'vim-airline/vim-airline-themes'
Plug 'sakshamgupta05/vim-todo-highlight'
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript', 'typescriptreact', 'javascriptreact']}
Plug 'yggdroot/indentline'
Plug 'tpope/vim-eunuch'
Plug 'airblade/vim-gitgutter'
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'}
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'

"-----------------Themes/Colorschemes-----------------"

Plug 'sainnhe/gruvbox-material'
Plug 'ghifarit53/tokyonight-vim'

"-------------------Lua/0.5.0-------------------------"

" Navigation
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'

" Languages
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'tjdevries/nlua.nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'rust-lang/rust.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
Plug 'hrsh7th/cmp-path', {'branch': 'main'}
Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
Plug 'simrat39/rust-tools.nvim'
Plug 'hrsh7th/vim-vsnip'

" Solidity Language Plugin
Plug 'tomlion/vim-solidity'

" Misc.
Plug 'mbbill/undotree'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'onsails/lspkind-nvim'

"------------------End of Plugins---------------------"
call plug#end()
"-----------------------------------------------------"

" set
set nu rnu
set nowrap
set textwidth=0
set wrapmargin=0
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set nosmarttab
set autoindent
set sw=2
set go-=T
set go-=m
set ls=2
set scrolloff=12
set signcolumn=yes
set colorcolumn=80
set nohlsearch
set incsearch
set mouse=
set ignorecase
set smartcase
set ttimeoutlen=100
set encoding=UTF-8
set hidden
set lazyredraw

set background=dark
set termguicolors

set backupdir=$HOME/.vim/tmp/backup/
set undodir=$HOME/.vim/tmp/undo/
set directory=$HOME/.vim/tmp/swap/
set backup
set noswapfile

set rtp+=/usr/local/opt/fzf


"Highlight Lsp/CoC virutal text commands
func! s:my_coc() abort 
  hi LspDiagnosticsVirtualTextError ctermfg=Red guifg=#ff0000
  hi LspDiagnosticsVirtualTextWarning ctermfg=Yellow guifg=#E0AF68
  hi LspDiagnosticsVirtualTextInformation ctermfg=Blue guifg=#7AA2F7 
  hi LspDiagnosticsVirtualTextHint ctermfg=Green guifg=#9ECE6A
endfunc

augroup color_coc | au!
  au ColorScheme * call s:my_coc()
augroup END

" let
let mapleader = " "
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Rust let commands
let g:rustfmt_autosave = 1

"let g:airline_theme='onedark'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-go',
      \ 'coc-css',
      \ 'coc-rls',
      \ ]
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:prettier#autoformat = 0

let g:one_allow_italics=1
"let g:airline_theme='one'
let g:airline_powerline_fonts=1

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ""
let g:airline_left_alt_sep = ""
let g:airline_right_sep = ""
let g:airline_right_alt_sep = ""
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden=1

autocmd StdinReadPre * let s:std_in=1

" Remap Escape Key
inoremap jj <Esc>

" Switch Tabs
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprev<CR>

" Vim Surround Keys
nmap <C-s> ysw

" Resize Vertical Panes
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

" Remap Commands
noremap <Leader>k :Autoformat<CR>
nmap <Leader>d :bd<CR>
nmap <Leader>bd :bp\|bd #<CR>

" Remapping Keys
nnoremap <Leader>o o<Esc>
nnoremap <Leader>p O<Esc>

nnoremap <Leader>P :Prettier<CR>

nnoremap <silent> <Leader>s :w<CR>

nnoremap <Leader>y "*y
vnoremap <Leader>y "*y

nnoremap <Leader>ut :UndotreeToggle<CR>

nnoremap <Leader>t :terminal<CR>

nnoremap <Leader>q :q<CR>

nmap <Leader>gc :Git commit<CR>
nmap <Leader>gp :Git push<CR>
nmap <Leader>G :G<CR>

nmap <Leader>md <Plug>MarkdownPreviewToggle

" augroup
augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

" syntax highlighting
syntax on

nnoremap <leader>n :NvimTreeToggle<CR>
nnoremap <leader>nr :NvimTreeRefresh<CR>
nnoremap <leader>nf :NvimTreeFindFile<CR>

set termguicolors " this variable must be enabled for colors to be applied properly

highlight NvimTreeFolderIcon guibg=blue

" Gruvbox material colorscheme settings
let g:gruvbox_material_background = 'medium'

if has('termguicolors')
  set termguicolors
endif

" Tokyonight colorscheme settings
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 0

" Edge colorscheme settings
let g:edge_style = 'neon'
let g:edge_enable_italic = 1
let g:edge_disable_italic_comment = 1

colorscheme tokyonight
let g:airline_theme = 'tokyonight'

source ~/.go.vimrc
