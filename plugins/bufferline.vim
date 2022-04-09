" In your init.lua or init.vim
set termguicolors
lua << EOF
require("bufferline").setup{
    options = {
        diagnostics_update_in_insert = true,
        numbers = function(opts)
            return string.format('%s', opts.ordinal)
        end,
        offsets = {
          {
            filetype = "nerdtree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
          }
        }
    }
}
EOF

" The key bindings of the bufferline plugin
nnoremap <silent><leader>gb <Cmd>BufferLinePick<CR>
nnoremap <silent><leader>cb <Cmd>BufferLinePickClose<CR>
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
