" Compile the current project with run.sh script 
nnoremap <leader>r :!sh run.sh<CR>

" Find something using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" The keybinds of nerd tree
nnoremap <leader>f :NERDTreeToggle<CR>

" The float terminal
nnoremap <silent><leader>t :Lspsaga open_floaterm<CR>

" The keybindings of code actions (not lsp code actions)
map <leader>c; <plug>NERDCommenterToggle
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
nnoremap <silent><leader>ch :Lspsaga hover_doc<CR>
nnoremap <silent><leader>cd :Lspsaga show_line_diagnostics<CR>
nnoremap <silent><leader>crn :Lspsaga rename<CR>

nnoremap <silent> [cd :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]cd :Lspsaga diagnostic_jump_prev<CR>
lua << EOF
local opts = { noremap=true, silent=true }
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
EOF

" The keybindings of git
" Git gui
nnoremap <silent><leader>gg :LazyGit<CR> 
" Git signs
nnoremap <silent>[gc :Gitsigns prev_hunk<CR> 
nnoremap <silent>]gc :Gitsigns next_hunk<CR> 
nnoremap <leader>gs :Gitsigns stage_hunk<CR>
nnoremap <leader>gs :Gitsigns stage_hunk<CR>
nnoremap <leader>gr :Gitsigns reset_hunk<CR>
nnoremap <leader>gr :Gitsigns reset_hunk<CR>
nnoremap <leader>gS :Gitsigns stage_buffer<CR> 
nnoremap <leader>gu :Gitsigns undo_stage_hunk<CR> 
nnoremap <leader>gR :Gitsigns reset_buffer<CR> 

lua << EOF
local opts = { noremap=true, silent=true }
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>gp', '<cmd>Gitsigns preview_hunk<CR>', opts)
vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>gd', '<cmd>Gitsigns diffthis<CR>', opts)
EOF
