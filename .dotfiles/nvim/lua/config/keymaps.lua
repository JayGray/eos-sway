local map = vim.keymap.set

map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<C-e>", "3<C-e>", { silent = true })
map({ "n", "x" }, "<C-y>", "3<C-y>", { silent = true })

-- remap arrow keys
map("n", "<down>", "<cmd>m .+1<cr>", { desc = "Move Down" })
map("n", "<up>", "<cmd>m .-2<cr>", { desc = "Move Up" })
map("i", "<down>", "<Nop>")
map("i", "<up>", "<Nop>")
map("i", "<left>", "<Nop>")
map("i", "<right>", "<Nop>")

-- Cancel search highlighting with ESC
-- nmap("<ESC>", ":nohlsearch<Bar>:echo<CR>")
