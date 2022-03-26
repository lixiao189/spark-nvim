" Manage your plugins here
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'akinsho/bufferline.nvim'

" Add some icons on some plugins
Plug 'ryanoasis/vim-devicons'

" The status bar plugin
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

" Show the diff signs of the git
Plug 'airblade/vim-gitgutter'

" Plugin for adding comment
Plug 'preservim/nerdcommenter'

" Plugin for more vue sfc support
Plug 'posva/vim-vue'

" The wrapper of the fzf plugin
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Close the html tag automatically
Plug 'alvan/vim-closetag'

" Highlight tag pair
Plug 'valloric/MatchTagAlways'

" The lsp server for vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" The debugger of the vim
Plug 'puremourning/vimspector'

" The file manager
Plug 'scrooloose/nerdtree' 
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'ryanoasis/vim-devicons' 
Plug 'kyazdani42/nvim-web-devicons' " for file icons

" Insert the pairs automatically
Plug 'chun-yang/auto-pairs'

" The indent plugin
Plug 'yggdroot/indentline'

" The plugin to preview markdown file
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" The themes of the VIM
Plug 'joshdick/onedark.vim'
call plug#end()

" ==============================================================================

" The basic configuration of neovim
set relativenumber 
syntax on
set splitbelow
set splitright
set nowrap " 禁止折行 
let mapleader="\<space>" " Use the <space> as the leader key
set wildmenu " Show the autocompletion of VIM command line
set tabstop=4 
set shiftwidth=4
set backspace=2 "设置删除键为增强模式 
set autoindent 
set cindent
set mouse=a " Enable the support for the mouse event
set cul
set laststatus=2 
set shortmess+=I " Don't show the introduction of the VIM
" set statusline=%F%m%r%h%w\ %=\ [%l,\ %v]\  
set expandtab
let g:onedark_termcolors=16
colorscheme onedark
filetype plugin indent on " required

" Settings with different filetype
autocmd FileType go set noexpandtab
autocmd FileType c,cpp,vue,html,css,ts,js,json set tabstop=2 shiftwidth=2

set guicursor=

" Set the settings of the internal terminal
tnoremap <Esc> <C-\><C-n>
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <leader>t :call OpenTerminal()<CR>

" Set the transparent background
highlight Normal guibg=NONE ctermbg=None 

" Disable quote concealing in JSON files
let g:vim_json_conceal=0

" set the default value of updatetime to 200ms
set updatetime=200

"==============================================================================

" The settings of the coc.nvim complete plugins
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

" ====================================================

" The settings of the bufferline
" In your init.lua or init.vim
set termguicolors
lua << EOF
require("bufferline").setup{
    options = {
        diagnostics = "coc",
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

" ====================================================

" The settings of the nerdtree
" Key binding
nnoremap <leader>f :NERDTreeToggle<CR>

let g:NERDTreeGitStatusUseNerdFonts = 1 
let NERDTreeShowHidden=1 "Show the hidden file defaultly

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
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

" ===================================================

" The settings of the nerdcommenter
let g:NERDCreateDefaultMappings = 0

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" The key bindings
map <leader>; <plug>NERDCommenterToggle

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" The vue comment support
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

" ===================================================

" The vim-vue settings
let g:vue_pre_processors = 'detect_on_enter'

" ===================================================

" The Other keybinds
" Compile the current project with run.sh script 
nnoremap <leader>r :!sh run.sh<CR>
" The settings of the fzf.vim plugi
nnoremap <c-f> :Ag<CR>
" Show all the commmands in the VIM
nnoremap <leader>c :Commands<CR> 
" Show the normal mode mappings
nnoremap <leader>m :Maps<CR>

" Set the plugin for closing tab
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml'
" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1
" dict
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" ============================================================================

" The settings of linght line
set noshowmode
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': { 
      \   'gitbranch': 'gitbranch#name',
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat'
      \ },
      \ }
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

