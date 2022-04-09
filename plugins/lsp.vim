set completeopt=menu,menuone,noselect


lua <<EOF
-- the settings of lspsaga 
local lspsaga = require 'lspsaga'
lspsaga.setup()
EOF
augroup lspsaga_filetypes
  autocmd!
  autocmd FileType LspsagaHover nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>
  autocmd FileType LspsagaCodeAction nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>
  autocmd FileType LspsagaFloaterm nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>
  autocmd FileType LspsagaDiagnostic nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>
  autocmd FileType LspsagaRename nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>
augroup END

lua << EOF
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'tsserver', 'gopls', 'clangd' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end
EOF
