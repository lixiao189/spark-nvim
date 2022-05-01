set noshowmode
lua << EOF
local lualine = require('lualine')

require('lualine').setup {
  options = {
    theme = 'gruvbox',
    disabled_filetypes = {'NvimTree','Outline'},
  },
}
EOF
