require("config")
vim.opt.relativenumber = true
vim.opt.number = true
vim.g.copilot_no_tab_map = true

-- Copilot
vim.api.nvim_set_keymap("i", "<C-s>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

-- Lazygit
function Open_lazygit()
	vim.cmd("!tmux split-window -h")
	vim.cmd("!tmux select-pane -R")
	vim.cmd("!tmux send-keys 'lazygit' Enter")
end

vim.api.nvim_set_keymap("n", "<leader>lg", ':lua Open_lazygit()<CR>', { noremap = true, silent = true })
