set noshowmode
lua << EOF
local lualine = require('lualine')

require('lualine').setup {
  options = {
    theme = 'gruvbox',
    disabled_filetypes = {'NvimTree','Outline'},
    section_separators = '', 
    component_separators = ''
  },
}
EOF
