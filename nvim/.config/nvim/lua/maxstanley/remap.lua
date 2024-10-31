vim.g.mapleader = " "

-- Visually select a block, use J/K to move the block down/up
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- File replace the hovered on WORD
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make the file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Copy selection to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Leave insert mode with Ctrl-c
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Bring the start of the next line to the end of the current line
vim.keymap.set("n", "J", "mzJ`z")

-- When scrolling search results, center the results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move the cursor to the beginning or end of the line
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

-- I don't think I have every used this properly sooooo
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")
