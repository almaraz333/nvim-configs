local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<leader>[", ":BufferPrevious<CR>", opts)
map("n", "<leader>]", ":BufferNext<CR>", opts)
map("n", "<leader>x", ":BufferClose<CR>", opts)
