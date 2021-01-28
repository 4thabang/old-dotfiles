"HerringtonDarkholme/yats.vim vim-plug
call plug#begin('~/.vim/plugged')

" plugin section

Plug 'peitalin/vim-jsx-typescript'
Plug 'jparise/vim-graphql'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'rakr/vim-one'
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install'}
Plug 'yggdroot/indentline'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'preservim/nerdtree'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'wakatime/vim-wakatime'

Plug 'dense-analysis/ale'

Plug 'preservim/nerdcommenter'

" Disabled due to lag on navigation
"  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()

" end vim-plug

" set
set nu rnu
set mouse=a
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

set lazyredraw

" coloring and background settings
set background=dark
set termguicolors

" directories
set backupdir=$HOME/.vim/tmp/backup/
set undodir=$HOME/.vim/tmp/undo/
set directory=$HOME/.vim/tmp/swap/
set backup
set noswapfile

" let
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let mapleader = " "

let g:airline_theme='onedark'
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
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"autocmd
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window left
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Switch Tabs
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprev<CR>



" Remap Commands
noremap <Leader>k :Autoformat<CR>
nmap <Leader>d :bd<CR>

" Remapping Keys
nnoremap <Leader>o o<Esc>
nnoremap <Leader>p O<Esc>

nnoremap <silent> <Leader>h :call CocActionAsync('doHover')<CR>

nnoremap <silent> <Leader>n :NERDTreeToggle<CR> 

" syntax highlighting
syntax on

let g:one_allow_italics=1
let g:airline_theme='one'
let g:airline_powerline_fonts=1


color one
if &background ==# 'dark'
  call one#highlight('Normal', '', '0F1219', 'none')
  call one#highlight('SignColumn', '', '161D26', 'none')
  call one#highlight('CursorLine', '', '161D26', 'none')
  call one#highlight('CursorLineNr', '', '161D26', 'none')
  call one#highlight('CursorColumn', '', '161D26', 'none')
  call one#highlight('LineNr', '', '161D26', 'none')
  call one#highlight('VertSplit', '0F141A', '0F141A', 'none')
  call one#highlight('NonText', '1D2632', '', 'none')
  call one#highlight('SpecialKey', '1D2632', '', 'none')
  call one#highlight('Keyword', '', '', 'italic')
  call one#highlight('DiffAdd', '52ACB8', '', '')
endif


source ~/.go.vimrc
