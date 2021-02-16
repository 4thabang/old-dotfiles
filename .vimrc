"HerringtonDarkholme/yats.vim vim-plug

"Plug 'tpope/vim-surround'

"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

"Plug 'junegunn/fzf.vim'

"------------------Start of Plugins-------------------"
call plug#begin('~/.vim/plugged')
"-------------------Existing Plugins------------------"

Plug 'wakatime/vim-wakatime'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'hugolgst/vimsence'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Chiel92/vim-autoformat'
Plug 'vim-airline/vim-airline-themes'
Plug 'sakshamgupta05/vim-todo-highlight'
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript', 'typescriptreact', 'javascriptreact']}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yggdroot/indentline'
Plug 'tpope/vim-eunuch'
Plug 'airblade/vim-gitgutter'
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'}
Plug 'ryanoasis/vim-devicons'

"-----------------Themes/Colorschemes-----------------"

Plug 'sainnhe/edge'
Plug 'sainnhe/gruvbox-material'
Plug 'ghifarit53/tokyonight-vim'

"-------------------Lua/0.5.0-------------------------"

" Navigation
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Languages
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'tjdevries/nlua.nvim'
Plug 'nvim-lua/lsp_extensions.nvim'

"------------------End of Plugins---------------------"
call plug#end()
"-----------------------------------------------------"

" Lua Require Files
lua require'nvim-treesitter.configs'.setup { highlight = {enable = true } }

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


"hi coc virutal text commands
func! s:my_coc() abort 
  hi CocErrorVirtualText ctermfg=Red guifg=#ff0000
  hi CocWarningVirtualText ctermfg=Yellow guifg=#E0AF68
  hi CocHintVirtualText ctermfg=Green guifg=#9ECE6A
  hi CocInfoVirtualText ctermfg=Blue guifg=#7AA2F7
endfunc

augroup color_coc | au!
  au ColorScheme * call s:my_coc()
augroup END

" let
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let mapleader = " "

"let g:airline_theme='onedark'
let g:airline#extensions#tabline#formatter = 'unique_tail'
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

let g:vimsence_client_id = '439476230543245312'
let g:vimsence_small_text = 'NeoVim'
let g:vimsence_small_image = 'neovim'
let g:vimsence_editing_details = 'Editing: {}'
let g:vimsence_editing_state = 'Working on: {}'
let g:vimsence_file_explorer_text = 'In NERDTree'
let g:vimsence_file_explorer_details = 'Looking for files'
let g:vimsence_custom_icons = {'filetype': 'iconname'}

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
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window left
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
      \ quit | endif

" Remap Escape Key
inoremap jj <Esc>

" Switch Tabs
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprev<CR>

" Resize Vertical Panes
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

" Remap Commands
noremap <Leader>k :Autoformat<CR>
nmap <Leader>d :bd<CR>

" Remapping Keys
nnoremap <Leader>o o<Esc>
nnoremap <Leader>p O<Esc>

nnoremap <Leader>P :Prettier<CR>

nnoremap <silent> <Leader>s :w<CR>

nnoremap <Leader>y "*y
vnoremap <Leader>y "*y

nnoremap <silent> <Leader>h :call CocActionAsync('doHover')<CR>

nnoremap <silent> <Leader>n :NERDTreeToggle<CR>

nnoremap <Leader>t :terminal<CR>

nnoremap <Leader>q :q<CR>

nmap <Leader>gc :Git commit<CR>
nmap <Leader>gp :Gpush<CR>
nmap <Leader>gs :G<CR>

nmap <Leader>md <Plug>MarkdownPreviewToggle

" augroup
augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

" syntax highlighting
syntax on

" Gruvbox material colorscheme settings
let g:gruvbox_material_background = 'medium'

if has('termguicolors')
  set termguicolors
endif

" Tokyonight colorscheme settings
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 0

" Edge colorscheme settings
let g:edge_style = 'edge'
let g:edge_enable_italic = 1
let g:edge_disable_italic_comment = 1

colorscheme tokyonight
let g:airline_theme = 'tokyonight'

source ~/.go.vimrc
