"syntax enable
filetype plugin indent on

set completeopt=menuone,noinsert,noselect
set shortmess+=c
set updatetime=300

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_enable_auto_paren = 1

autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

nnoremap <leader>hd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>hi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>hr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>h :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>hrn :lua vim.lsp.buf.rename()<CR>

lua << EOF
local on_attach = function(client)
  require'completion'.on_attach(client)
end

require'lspconfig'.rust_analyzer.setup{ on_attach=on_attach }
require'lspconfig'.tsserver.setup{ on_attach=on_attach }
require'lspconfig'.gopls.setup{ on_attach=on_attach }
require'lspconfig'.pyls.setup{ on_attach=on_attach }


local function preview_location_callback(_,_, result)
  if result == nil or vim.tbl_isempty(result) then
    return nil
  end
  vim.lsp.util.preview_location(result[1])
end

function PeekDefinition()
  local params = vim.lsp.util.make_position_params()
  return vim.lsp.buf_request(0, 'textDocument/definition', prams, preview_location_callback)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
EOF

"lua require'lspconfig'.yamlls.setup{ on_attach=require'completion'.on_attach }

"lua require'lspconfig'.jsonls.setup{ on_attach=require'completion'.on_attach }

"lua require'lspconfig'.dockerls.setup{ on_attach=require'completion'.on_attach }

"lua require'lspconfig'.cssls.setup{ on_attach=require'completion'.on_attach }
