set shortmess+=c
" The list of the lsp plugins
let g:coc_global_extensions = [
            \'coc-java',
            \'coc-prettier',
            \'coc-lua',
            \'coc-imselect',
			\'coc-json',
			\'coc-vimlsp',
			\'coc-clangd',
			\'coc-go',
			\'coc-yaml',
			\'coc-xml',
            \'@yaegassy/coc-volar',
			\'coc-pyright',
			\'coc-phpls',
			\'coc-html',
			\'coc-tsserver',
			\'coc-css']
autocmd FileType scss setl iskeyword+=@-@
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Use <space> + h to show documentation in preview window.
nnoremap <leader>h :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" The updatetime of the coc.nvim
set updatetime=200
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Set the hot key to autoformat the file
nmap <s-f> :Format<cr>
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" The hot key for coc.nvim action
nnoremap <leader>a :CocAction<cr>
" The hot key for coc.nvim diagnostics
nnoremap <leader>d :CocDiagnostics<cr>
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"