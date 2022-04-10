lua << EOF
-- empty setup using defaults: add your own options
require'nvim-tree'.setup {
    diagnostics = {
      enable = true,
      show_on_dirs = true,
  },
}
EOF
