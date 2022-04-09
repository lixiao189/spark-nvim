" Load plugins for vim
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/editor/plugins.vim'

" Load basic configuration for neovim
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/editor/basic.vim'

" The settings of the keybinding
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/editor/keybindings.vim'

" The settings of the coc.nvim complete plugins
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/plugins/lsp.vim'

" The settings of the bufferline
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/plugins/bufferline.vim'

" The settings of the nerdtree
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/plugins/nerdtree.vim'

" The settings of the closetag plugin
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/plugins/closetag.vim'

" The settings of the nerdcommenter
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/plugins/nerdcommenter.vim'

" The settings of linght line
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/plugins/lightline.vim'

" The vim-vue settings
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/plugins/vim-vue.vim'


