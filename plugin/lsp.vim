"syntax enable
filetype plugin indent on

set completeopt=menuone,noinsert,noselect
set shortmess+=c
set updatetime=300

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

nnoremap <leader>hd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>hi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>hr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>h :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>hrn :lua vim.lsp.buf.rename()<CR>

lua <<EOF
local nvim_lsp = require'lspconfig'

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    server = {
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy",
                },
            },
        },
    },
}

require('rust-tools').setup(opts)

nvim_lsp.gopls.setup {
  cmd = {"gopls", "serve"},
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

require'nvim-treesitter.configs'.setup{
  highlight = {
    enable = true
  }
}

require("nvim-tree").setup({
  filters = {
    custom = {},
    dotfiles = true,
  },
  
  open_on_setup = true,
  open_on_tab = true,
  disable_netrw = false,
  hijack_netrw = false,

  actions = {
    open_file = {
      quit_on_open = true,
    },
  },

  update_focused_file = {
    enable = true,
  },

  view = {
    width = 40,
    side = "left",
  },

  renderer = {
    highlight_git = true,
    add_trailing = true,
    group_empty = true,
    root_folder_modifier = ":~",
    indent_markers = {
      enable = true,
    },

  icons = {
    show = {
      file = true,
      folder = true,
      git = true,
    },

    glyphs = {
      default = '',                                                              
      symlink = '',                                                              
      git = {                                                                    
        unstaged = "✗",                                                           
        staged = "✓",                                                             
        unmerged = "",                                                           
        renamed = "➜",                                                            
        untracked = "★"                                                           
      },                                                                         
      folder = {                                                                  
        default = "",                                                            
        open = "",                                                               
        empty = "",                                                              
        empty_open = "",                                                         
        symlink = "",                                                            
        symlink_open = "", 
      },
    },
  },
}})
EOF

lua <<EOF
local cmp = require'cmp'

local lspkind = require("lspkind")

cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },

  formatting = {
    format = lspkind.cmp_format({

    mode = 'symbol',

    before = function(entry, vim_item)

      -- vim_item.kind = lspkind.presets.default[vim_item.kind]

      vim_item.menu = ({
            nvim_lsp = "[LSP]",
            look = "[Dict]",
            buffer = "[Buffer]",
          })[entry.source.name]
      return vim_item
    end
    }) 
  },

  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },


  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF
