vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jj", "<ESC>")

keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x')

keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")
keymap.set("n", "<leader>se", "<C-w>e")
keymap.set("n", "<leader>sx", ":close<CR>")

keymap.set("n", "<leader>to", ":tabnew<CR>")
keymap.set("n", "<leader>tx", ":tabclose<CR>")
keymap.set("n", "<leader>tn", ":tabn<CR>")
keymap.set("n", "<leader>tb", ":tabp<CR>")

keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

keymap.set("n", "<leader>e", ":Neotree toggle<CR>")

keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>")
keymap.set("n", "<leader>fc", ":Telescope grep_string<CR>")
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>")

keymap.set("t", "<ESC>", "<C-\\><C-n>")
