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
" Plug 'chun-yang/auto-pairs'

" The indent plugin
Plug 'yggdroot/indentline'

" The plugin to preview markdown file
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" The themes of the VIM
Plug 'joshdick/onedark.vim'
call plug#end()
