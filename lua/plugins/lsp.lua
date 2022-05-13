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

-- Lsp server list
local servers = {
    'pyright',
    'tsserver',
    'gopls',
    'golangci_lint_ls',
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
require("nvim-lsp-installer").setup({
    ensure_installed = servers,
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
})

-- nvim-cmp setup
local luasnip = require("luasnip")
local cmp = require 'cmp'
cmp.setup {
    view = {
        entries = "native" -- can be "custom", "wildmenu" or "native"
    },
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
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
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
    view = {
        entries = "custom",
    },
    sources = {
        { name = 'cmdline' },
    },
    mapping = cmp.mapping.preset.cmdline({}),
})
require 'cmp'.setup.cmdline('/', {
    view = {
        entries = "custom",
    },
    sources = {
        { name = 'buffer' }
    },
    mapping = cmp.mapping.preset.cmdline({}),
})

-- The settings of auto completion and lsp setup
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

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

-- Setup lsp server
for _, server in ipairs(servers) do
    if (server == "volar" or server == "tsserver") then
        opts.on_attach = function(client)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
        end
    elseif (server == "intelephense") then
        opts.settings = {
            intelephense = {
                stubs = {
                    "redis",
                    "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype", "curl", "date", "dba", "dom", "enchant", "exif", "FFI", "fileinfo", "filter", "fpm", "ftp", "gd", "gettext", "gmp", "hash", "iconv", "imap", "intl", "json", "ldap", "libxml", "mbstring", "meta", "mysqli", "oci8", "odbc", "openssl", "pcntl", "pcre", "PDO", "pdo_ibm", "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql", "Phar", "posix", "pspell", "readline", "Reflection", "session", "shmop", "SimpleXML", "snmp", "soap", "sockets", "sodium", "SPL", "sqlite3", "standard", "superglobals", "sysvmsg", "sysvsem", "sysvshm", "tidy", "tokenizer", "xml", "xmlreader", "xmlrpc", "xmlwriter", "xsl", "Zend OPcache", "zip", "zlib",
                },
                environment = {
                    phpVersion = "7.4.28"
                }
            }
        }
    elseif (server == "sumneko_lua") then
        opts = require("lua-dev").setup()
    end

    require('lspconfig')[server].setup(opts)
end

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