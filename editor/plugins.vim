" Manage your plugins here
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'akinsho/bufferline.nvim'
Plug 'famiu/bufdelete.nvim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'dstein64/vim-startuptime'

" The welcome plugin
Plug 'glepnir/dashboard-nvim'

" The search and replace plugin
Plug 'nvim-lua/plenary.nvim'
Plug 'windwp/nvim-spectre'

" Status line plugin
Plug 'nvim-lualine/lualine.nvim'

" Notify plugin
Plug 'rcarriga/nvim-notify'

" Markdown preview plugin
Plug 'ellisonleao/glow.nvim', {'branch': 'main'}

" Scroll bar
Plug 'petertriho/nvim-scrollbar'

" The lsp support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'tami5/lspsaga.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'
" The symbol tree plugin
Plug 'simrat39/symbols-outline.nvim'  
Plug 'ray-x/lsp_signature.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'
Plug 'hrsh7th/cmp-cmdline'

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
Plug 'windwp/nvim-ts-autotag'

" The commenter
Plug 'numToStr/Comment.nvim'

" The indent plugin
Plug 'lukas-reineke/indent-blankline.nvim'

" The plugin to preview markdown file
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" The themes of the VIM
Plug 'joshdick/onedark.vim'
Plug 'ellisonleao/gruvbox.nvim'
call plug#end()
