" Manage your plugins here
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'akinsho/bufferline.nvim'

" Add some icons on some plugins
Plug 'ryanoasis/vim-devicons'

" The status bar plugin
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

" The lsp support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'tami5/lspsaga.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'


" The telescope support
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Show the diff signs of the git
Plug 'airblade/vim-gitgutter'

" Plugin for adding comment
Plug 'preservim/nerdcommenter'

" Plugin for more vue sfc support
Plug 'posva/vim-vue'

" Close the html tag automatically
Plug 'alvan/vim-closetag'

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
