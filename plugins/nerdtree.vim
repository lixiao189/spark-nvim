" Key binding
nnoremap <leader>f :NERDTreeToggle<CR>

let g:NERDTreeGitStatusUseNerdFonts = 1 
let NERDTreeShowHidden=1 "Show the hidden file defaultly

" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

let NERDTreeIgnore=[
            \'.git$[[dir]]', 
            \'dist$[[dir]]', 
            \'node_modules$[[dir]]', 
            \'\.d$[[dir]]', 
            \'\.o$[[file]]', 
            \'tmp/cache$[[path]]']