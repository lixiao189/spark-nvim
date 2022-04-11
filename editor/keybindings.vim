" use esc key to clear hightlight of seaching
nnoremap <esc> :noh<return><esc>

lua << EOF
local function map(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end
-- Linewise comment toggle using C-/
map('n', '<C-_>', '<CMD>lua require("Comment.api").toggle_current_linewise()<CR>')
map('x', '<C-_>', '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

local wk = require("which-key")
wk.register({
  t = { ":Lspsaga open_floaterm<cr>", "Open terminal" },
  m = { ":NvimTreeToggle<CR>", "Toggle file manager" },
  r = { ":!sh run.sh<cr>", "Run code with run.sh" },  
  f = {
    name = "+find",
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    g = { "<cmd>Telescope live_grep<cr>", "Search text globally" },
  },
  g = {
    name = "+git action",
    t = { "<cmd>LazyGit<cr>", "Show git tui" },
    p = { "<cmd>Gitsigns preview_hunk<CR>", "Preview the hunk changes" },
    d = { "<cmd>Gitsigns diffthis<CR>", "Show diff in this buffer" },
    s = { ":Gitsigns stage_hunk<CR>", "Stage hunk" },
    r = { ":Gitsigns reset_hunk<CR>", "Reset hunk" },
    S = { ":Gitsigns stage_buffer<CR>", "Stage buffer" },
    u = { ":Gitsigns undo_stage_hunk<CR>", "Undo stage" },
    R = { ":Gitsigns reset_buffer<CR>", "Reset buffer" },
    j = {
      name = "+jump hunk",
      p = { ":Gitsigns prev_hunk<CR>", "Previous change" },
      n = { ":Gitsigns next_hunk<CR>", "Next change" },
    }
  },
  b = {
    name = "+buffer",
    g = { "<Cmd>BufferLinePick<CR>", "Go to buffer" },
    c = { "<Cmd>BufferLinePickClose<CR>", "Close buffer" },
  },
  c = {
    name = "+code action",
    a = { ":Lspsaga code_action<cr>", "Lsp Code action" },
    h = { ":Lspsaga hover_doc<cr>", "Show Lsp hover" },
    s = { ":SymbolsOutline<cr>", "Symbol outline"},
    d = { ":Lspsaga show_line_diagnostics<cr>", "Show code diagnostics" },
    f = { ":lua vim.lsp.buf.formatting()<CR>", "Format the code" },
    r = { ":Lspsaga rename<cr>", "Rename variable" },
    dn = { ":Lspsaga diagnostic_jump_next<cr>", "Jump to next diagnostic" },
    dp = { ":Lspsaga diagnostic_jump_prev<CR>", "Jump to previous diagnostic" },
  },
}, { prefix = "<leader>" })

wk.setup{
  layout = {
    align = "center",
  },
}
EOF
