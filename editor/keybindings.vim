" Compile the current project with run.sh script 
nnoremap <leader>r :!sh run.sh<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" nerd commenter key binding
map <leader>; <plug>NERDCommenterToggle

" The keybinds of nerd tree
nnoremap <leader>f :NERDTreeToggle<CR>

" The keybindings of lspsaga
nnoremap <silent><leader>a :Lspsaga code_action<CR>
nnoremap <silent><leader>h :Lspsaga hover_doc<CR>
nnoremap <silent><leader>rn :Lspsaga rename<CR>
nnoremap <silent><leader>t :Lspsaga open_floaterm<CR>
nnoremap <silent><leader>gd :Lspsaga preview_definition<CR>
lua << EOF
local opts = { noremap=true, silent=true }
vim.api.nvim_buf_set_keymap(bufnr, 'n', 'F', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
EOF
