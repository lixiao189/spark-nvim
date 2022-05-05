local function map(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end
-- Use esc to stop highlighting
map("n", "<esc>", "<CMD>noh<CR>")

-- Linewise comment toggle using C-/
map('n', '<C-_>', '<CMD>lua require("Comment.api").toggle_current_linewise()<CR>')
map('x', '<C-_>', '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

map("n", "<A-Down>", ":resize -2<CR>")
map("n", "<A-Up>", ":resize +2<CR>")
map("n", "<A-Left>", ":vertical resize -2<CR>")
map("n", "<A-Right>", ":vertical resize +2<CR>")

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

local wk = require("which-key")
wk.register({
  t = { ":ToggleTerm<cr>", "Open terminal" },
  m = { ":NvimTreeToggle<CR>", "Toggle file manager" },
  r = { ":!sh run.sh<cr>", "Run code with run.sh" },  
  f = {
    name = "+find",
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    o = { "<cmd>Telescope oldfiles<cr>", "Show recent old file" },
    r = { "<cmd>lua require('spectre').open()<cr>", "Find and replace" },
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
    k = { ":lua vim.lsp.buf.hover()<CR>", "Lsp document hover" },
    f = { ":lua vim.lsp.buf.formatting()<CR>", "Format the code" },
    r = { ":Lspsaga rename<cr>", "Rename variable" },
    d = { ":TroubleToggle<cr>", "Show diagnostics" },
    D = { ":Telescope lsp_definitions<cr>", "Jump to defination" },
    R = { ":Telescope lsp_references<cr>", "Show the references" },
  },
}, { prefix = "<leader>" })

wk.setup{
  layout = {
    align = "center",
  },
}
