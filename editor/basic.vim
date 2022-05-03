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
set expandtab
set guicursor=i:hor1
set pumheight=10
colorscheme gruvbox
filetype plugin indent on " required

" Settings with different filetype
autocmd FileType go set noexpandtab
autocmd FileType vim,c,cpp,vue,html,css,ts,yaml,js,json,typescript setlocal tabstop=2 shiftwidth=2

" Set the transparent background
highlight Normal guibg=NONE ctermbg=None 

" Disable quote concealing in JSON files
let g:vim_json_conceal=0

" set the default value of updatetime to 200ms
set updatetime=200
let g:cursorhold_updatetime = 200

lua << EOF
vim.opt.termguicolors = true
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.titlestring = "nvim" -- what the title of the window will be set to
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.swapfile = false -- creates a swapfile
-- vim.opt.timeoutlen = 100 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited

EOF
