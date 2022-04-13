set completeopt=menu,menuone,noselect
" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4

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
local lsp_signature = require "lsp_signature"
lsp_signature.setup {
  floating_window = false,
}

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local lsp_installer = require "nvim-lsp-installer"

-- Lsp server list
local servers = { 
    'pyright', 
    'tsserver', 
    'gopls', 
    'clangd', 
    'cmake',
    'volar', 
    'jdtls', 
    'jsonls', 
    'yamlls',
    'vimls',
    'sumneko_lua'
}

-- Install Server automatically
for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end

-- The settings of auto completion
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}
    -- Turn off snippet support for lsp 
    capabilities.textDocument.completion.completionItem.snippetSupport = false
    opts.capabilities = capabilities
    opts.on_attach = function(client, bufnr)
      lsp_signature.on_attach()      
    end
    server:setup(opts)
end)

-- nvim-cmp setup
local cmp = require 'cmp'
local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        return vim_item
      end
    })
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm {
      -- behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
  },
}

-- auto format on saving
vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")

-- prettier settings
local null_ls = require("null-ls")
local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `prettierd`
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
    "vue",
  },

  -- prettier format options (you can use config files too. ex: `.prettierrc`)
  -- arrow_parens = "always",
  -- bracket_spacing = true,
  -- embedded_language_formatting = "auto",
  -- end_of_line = "lf",
  -- html_whitespace_sensitivity = "css",
  -- jsx_bracket_same_line = false,
  -- jsx_single_quote = false,
  -- print_width = 80,
  -- prose_wrap = "preserve",
  -- quote_props = "as-needed",
  -- semi = true,
  -- single_quote = false,
  -- tab_width = 2,
  -- trailing_comma = "es5",
  -- use_tabs = false,
  -- vue_indent_script_and_style = false,
})

EOF
