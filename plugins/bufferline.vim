" In your init.lua or init.vim
set termguicolors
lua << EOF
require("bufferline").setup{
    options = {
        diagnostics_update_in_insert = true,
        diagnostics = "nvim_lsp",
        numbers = function(opts)
            return string.format('%s', opts.ordinal)
        end,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
          }
        }
    }
}
EOF


