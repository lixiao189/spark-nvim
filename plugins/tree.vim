lua << EOF
-- empty setup using defaults: add your own options
require'nvim-tree'.setup {
  view = {
    preserve_window_proportions = true,
  }, 
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
}
EOF
