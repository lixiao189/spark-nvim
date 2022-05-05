vim.o.completeopt = "menu,menuone,noselect"

vim.cmd [[
  augroup lspsaga_filetypes
  autocmd!
  autocmd FileType LspsagaHover nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>
  autocmd FileType LspsagaCodeAction nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>
  autocmd FileType LspsagaFloaterm nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>
  autocmd FileType LspsagaDiagnostic nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>
  autocmd FileType LspsagaRename nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>
  augroup END
]]

-- the settings of lspsaga
local lspsaga = require 'lspsaga'
lspsaga.setup()

-- Lsp signature settings
local lsp_signature = require "lsp_signature"
lsp_signature.setup {
    floating_window = false,
}

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
    'sumneko_lua',
    'intelephense',
}

-- Install Server automatically
for _, name in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found and not server:is_installed() then
        require("notify")("Installing " .. name)
        server:install()
    end
end

-- nvim-cmp setup
local has_words_before = function()
    local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require 'cmp'
cmp.setup {
    formatting = {
        format = require("lspkind").cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            before = function(_, vim_item)
                return vim_item
            end
        })
    },
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm {
            -- behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'luasnip' },
    },
}

-- The settings of the cmdline complete
require 'cmp'.setup.cmdline(':', {
    sources = {
        { name = 'cmdline' },
        { name = 'buffer' },
    },
    mapping = cmp.mapping.preset.cmdline({}),
})
require 'cmp'.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    },
    mapping = cmp.mapping.preset.cmdline({}),
})

-- The settings of auto completion and lsp setup
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
lsp_installer.on_server_ready(function(server)
    local opts = {}
    opts.capabilities = capabilities

    opts.on_attach = function(client, _)
        -- highlight symbol under cursor
        if client.resolved_capabilities.document_highlight then
            vim.cmd [[
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd! CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd! CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
          autocmd! CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]]
        end

        lsp_signature.on_attach()
    end

    if (server.name == "volar" or server.name == "tsserver") then
        opts.on_attach = function(client)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
        end
    end

    if (server.name == "sumneko_lua") then
        opts.settings = {
            Lua = {
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { 'vim' },
                }
            }

        }
    end

    server:setup(opts)
end)


-- prettier settings
require("null-ls").setup()
require("prettier").setup {
    bin = 'prettier', -- or `prettierd`
    filetypes = {
        "css",
        "html",
        "javascript",
        "javascriptreact",
        "less",
        "scss",
        "typescript",
        "typescriptreact",
        "vue",
    },
}
