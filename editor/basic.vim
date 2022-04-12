" The basic configuration of neovim
set relativenumber 
syntax on
set splitbelow
set splitright
set nowrap " 禁止折行 
let mapleader="\<space>" " Use the <space> as the leader key
set wildmenu " Show the autocompletion of VIM command line
set tabstop=4 
set scrolloff=8
set sidescrolloff=8
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
autocmd FileType vim,c,cpp,vue,html,css,ts,js,json set tabstop=2 shiftwidth=2

" Set the transparent background
highlight Normal guibg=NONE ctermbg=None 

" Disable quote concealing in JSON files
let g:vim_json_conceal=0

" set the default value of updatetime to 200ms
set updatetime=200
