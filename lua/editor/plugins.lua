vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'akinsho/bufferline.nvim'
    use 'famiu/bufdelete.nvim'
    use 'antoinemadec/FixCursorHold.nvim'
    use 'dstein64/vim-startuptime'

    -- The welcome plugin
    use 'glepnir/dashboard-nvim'

    -- The search and replace plugin
    use 'nvim-lua/plenary.nvim'
    use 'windwp/nvim-spectre'

    -- Status line plugin
    use 'nvim-lualine/lualine.nvim'

    -- Notify plugin
    use 'rcarriga/nvim-notify'

    -- Scroll bar
    use 'petertriho/nvim-scrollbar'

    -- The lsp support
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'tami5/lspsaga.nvim'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'onsails/lspkind-nvim'
    use 'folke/trouble.nvim'
    use 'simrat39/symbols-outline.nvim'
    use 'ray-x/lsp_signature.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'MunifTanjim/prettier.nvim'
    use 'hrsh7th/cmp-cmdline'
    use 'folke/lua-dev.nvim'

    -- The plugin for key bindings
    use 'folke/which-key.nvim'

    -- Inner terminal
    use 'akinsho/toggleterm.nvim'

    -- The git tui client
    use 'kdheepak/lazygit.nvim'

    -- The telescope support
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    -- Show the diff signs of the git
    use 'lewis6991/gitsigns.nvim'

    -- Auto pairs
    use 'windwp/nvim-autopairs'
    use 'p00f/nvim-ts-rainbow'

    -- The file manager
    use 'kyazdani42/nvim-web-devicons' -- for file icons
    use 'kyazdani42/nvim-tree.lua'

    -- Tree sitter plugin
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'windwp/nvim-ts-autotag'
    use 'lewis6991/spellsitter.nvim'
    use 'abecodes/tabout.nvim'

    -- The commenter
    use 'numToStr/Comment.nvim'

    -- The indent plugin
    use 'lukas-reineke/indent-blankline.nvim'

    -- The plugin to solve cutting problem
    use 'gbprod/cutlass.nvim'

    -- Themes
    use 'folke/tokyonight.nvim'
    use 'ellisonleao/gruvbox.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
