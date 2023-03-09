"HerringtonDarkholme/yats.vim vim-plug

"------------------Start of Plugins-------------------"
call plug#begin('~/.vim/plugged')
"-------------------Existing Plugins------------------"

Plug 'wakatime/vim-wakatime'
"Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Chiel92/vim-autoformat'
Plug 'vim-airline/vim-airline-themes'
Plug 'sakshamgupta05/vim-todo-highlight'
Plug 'yggdroot/indentline'
Plug 'tpope/vim-eunuch'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'

"-----------------Themes/Colorschemes-----------------"

Plug 'sainnhe/gruvbox-material'
Plug 'ghifarit53/tokyonight-vim'
Plug 'cocopon/iceberg.vim'

Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }

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

" Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'nvim-telescope/telescope-dap.nvim'

" JavaScript, TypeScript, React
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'

" Solidity Language Plugin
Plug 'tomlion/vim-solidity'

" Misc.
Plug 'mbbill/undotree'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'onsails/lspkind-nvim'
Plug 'andweeb/presence.nvim'

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
let g:airline_powerline_fonts=1

" unicode symbols
let g:airline_left_sep = ''
"let g:airline_left_sep = '»'
let g:airline_left_sep = ''
"let g:airline_left_sep = '▶'
let g:airline_right_sep = ''
"let g:airline_right_sep = '«'
let g:airline_right_sep = ''
"let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"" airline symbols
"let g:airline_left_sep = ""
"let g:airline_left_alt_sep = ""
"let g:airline_right_sep = ""
"let g:airline_right_alt_sep = ""
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden=1

" Discord Presence
" General options
let g:presence_auto_update         = 1
let g:presence_neovim_image_text   = "The One True Text Editor"
let g:presence_main_image          = "neovim"
let g:presence_client_id           = "793271441293967371"
let g:presence_debounce_timeout    = 10
let g:presence_enable_line_number  = 0
let g:presence_blacklist           = []
let g:presence_buttons             = 1
let g:presence_file_assets         = {}
let g:presence_show_time           = 1

" Rich Presence text options
let g:presence_editing_text        = "Editing %s"
let g:presence_file_explorer_text  = "Browsing %s"
let g:presence_git_commit_text     = "Committing changes"
let g:presence_plugin_manager_text = "Managing plugins"
let g:presence_reading_text        = "Reading %s"
let g:presence_workspace_text      = "Working on %s"
let g:presence_line_number_text    = "Line %s out of %s"

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

nnoremap <silent><Leader>w :w<CR>

nnoremap <Leader>y "*y
vnoremap <Leader>y "*y

nnoremap <Leader>ut :UndotreeToggle<CR>

nnoremap <Leader>t :terminal<CR>

nnoremap <Leader>q :q<CR>

nnoremap <silent> gb :BufferLinePick<CR>

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

lua << END
local lualine_opts = {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 1
      }
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

require('lualine').setup(lualine_opts)

require('bufferline').setup{
  options = {
    buffer_close_icon = '',
    close_icon = '',
    diagnostics = 'nvim_lsp',
    offsets = {
      {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center" ,
          separator = false,
      }
    },


    -- start of diagnostics icons function --
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    -- end of diagnostics icons function --
    show_tab_indicators = true,
  }
}
END

let g:onedark_config = {
    \ 'style': 'darker',
\}

colorscheme iceberg
let g:airline_theme='gruvbox'

source ~/.go.vimrc
