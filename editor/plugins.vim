" Manage your plugins here
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'akinsho/bufferline.nvim'
Plug 'famiu/bufdelete.nvim'
Plug 'antoinemadec/FixCursorHold.nvim'

" The welcome plugin
Plug 'glepnir/dashboard-nvim'

" Status line plugin
Plug 'nvim-lualine/lualine.nvim'

" Notify plugin
Plug 'rcarriga/nvim-notify'

" Scroll bar
Plug 'petertriho/nvim-scrollbar'

" The lsp support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'tami5/lspsaga.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'onsails/lspkind-nvim'
" The symbol tree plugin
Plug 'simrat39/symbols-outline.nvim'  
Plug 'ray-x/lsp_signature.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'

" The plugin for key bindings 
Plug 'folke/which-key.nvim'

" Inner terminal
Plug 'akinsho/toggleterm.nvim'

" The git tui client
Plug 'kdheepak/lazygit.nvim'

" The telescope support
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Show the diff signs of the git
Plug 'lewis6991/gitsigns.nvim'

" Auto pairs
Plug 'windwp/nvim-autopairs'

" The file manager
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Tree sitter plugin
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" The commenter
Plug 'numToStr/Comment.nvim'

" The indent plugin
Plug 'lukas-reineke/indent-blankline.nvim'

" The plugin to preview markdown file
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" The themes of the VIM
Plug 'joshdick/onedark.vim'
call plug#end()
