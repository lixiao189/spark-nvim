vim.o.showmode = false

require('lualine').setup {
    options = {
        theme = 'gruvbox',
        disabled_filetypes = { 'NvimTree', 'Outline' },
        section_separators = '',
        component_separators = ''
    },
}
